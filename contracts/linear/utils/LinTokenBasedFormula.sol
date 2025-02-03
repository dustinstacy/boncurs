// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @title  LinTokenBasedFormula
/// @notice This contract provides functions for calculating the purchase and sale return values on a linear token-based curve using a scaling factor.
///     The formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return.
abstract contract LinTokenBasedFormula {
    /// @dev Max scaling factor in basis points
    uint32 private constant MAX_SCALE = 1000000; // 10000%
    /// @dev 1:1 scaling factor in basis points
    uint32 private constant PURE_LINEAR_SCALE = 10000; // 100%
    /// @dev Wei as decimal precision for calculations
    uint256 private constant WAD = 10 ** 18;

    // Custom errors
    error LinTokenBasedFormula__InvalidInput();

    /// @notice Returns the purchase cost for a given conversion (in the reserve token) for a desired amount (in the main token).
    /// @param supply token total supply
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in basis points, 1-10000
    /// @param amount amount of tokens to purchase
    /// @return purchaseCost cost of the conversion
    function _calculateLinTokenBasedPurchaseCost(
        uint256 supply,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 purchaseCost) {
        // Validate Input
        if (initialCost == 0 || scalingFactor == 0 || scalingFactor > MAX_SCALE) {
            revert LinTokenBasedFormula__InvalidInput();
        }

        // If the amount is 0, return 0
        if (amount == 0) {
            return 0;
        }

        // If the supply is 0 and the amount is 1 return the initial cost
        if (supply == 0 && amount == 1) {
            return initialCost;
        }

        // Case for no scaling (pure linear case)
        if (scalingFactor == PURE_LINEAR_SCALE) {
            return purchaseCost = initialCost * (amount * supply + (amount * (amount + 1)) / 2);
        }

        // Calculate the scaled initial cost and its adjustment
        uint256 scaledInitialCost = initialCost * scalingFactor / PURE_LINEAR_SCALE;
        uint256 initialCostAdjustment =
            (scalingFactor > PURE_LINEAR_SCALE) ? scaledInitialCost - initialCost : initialCost - scaledInitialCost;

        // Calculate the raw cost and the total adjustment based on amount
        uint256 rawCost = scaledInitialCost * (amount * supply + (amount * (amount + 1)) / 2);
        uint256 initialAdjustmentTotal = initialCostAdjustment * amount;

        // If the scaling factor is greater, subtract the adjustment, otherwise add it to the raw cost
        return purchaseCost =
            (scalingFactor > PURE_LINEAR_SCALE) ? rawCost - initialAdjustmentTotal : rawCost + initialAdjustmentTotal;
    }

    /// @notice Returns the sale value for a given amount (in the main token) as a conversion into the reserve token.
    /// @param supply token total supply
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in basis points, 1-10000
    /// @param amount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function _calculateLinTokenBasedSaleReturn(
        uint256 supply,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 saleReturn) {
        // Validate Input
        if (initialCost == 0 || scalingFactor == 0 || scalingFactor > MAX_SCALE || amount > supply) {
            revert LinTokenBasedFormula__InvalidInput();
        }

        // If the amount or supply is 0, return 0
        if (supply == 0 || amount == 0) {
            return 0;
        }

        // Case for no scaling (pure linear case)
        if (scalingFactor == PURE_LINEAR_SCALE) {
            return initialCost * (amount * supply - (amount * (amount - 1)) / 2);
        }

        // Calculate the scaled initial cost and its adjustment
        uint256 scaledInitialCost = initialCost * scalingFactor / PURE_LINEAR_SCALE;
        uint256 initialCostAdjustment =
            (scalingFactor > PURE_LINEAR_SCALE) ? scaledInitialCost - initialCost : initialCost - scaledInitialCost;

        // Calculate the raw cost and the total adjustment based on amount
        uint256 rawCost = scaledInitialCost * (amount * supply - (amount * (amount - 1)) / 2);
        uint256 initialAdjustmentTotal = initialCostAdjustment * amount;

        // If the scaling factor is greater, subtract the adjustment, otherwise add it
        return saleReturn =
            (scalingFactor > PURE_LINEAR_SCALE) ? rawCost - initialAdjustmentTotal : rawCost + initialAdjustmentTotal;
    }
}
