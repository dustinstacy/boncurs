// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @title  ExpTokenBasedFormula
/// @notice This contract provides functions for calculating the purchase and sale return values on an exponential token-based curve using a scaling factor.
///     The formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return.
abstract contract ExpTokenBasedFormula {
    /// @dev Max reserve ratio in basis points
    uint32 private constant MAX_SCALE = 1000000; // 10000%
    ///@dev Wei as decimal precision for calculations
    uint256 private constant WAD = 10 ** 18;

    // Custom errors
    error ExpTokenBasedFormula__InvalidInput();

    /// @notice Returns the purchase cost for a given conversion (in the reserve token) for a desired amount (in the main token).
    /// @param supply token total supply
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in basis points, 1-10000
    /// @param amount amount of tokens to purchase
    /// @return purchaseCost cost of the conversion
    function _calculateExpTokenBasedPurchaseCost(
        uint256 supply,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 purchaseCost) {
        // Validate Input
        if (initialCost == 0 || scalingFactor == 0 || scalingFactor > MAX_SCALE) {
            revert ExpTokenBasedFormula__InvalidInput();
        }

        // If the amount is 0, return 0
        if (amount == 0) {
            return 0;
        }

        // If the supply is 0 and the amount is 1 return the initial cost
        if (supply == 0) {
            if (amount == 1) {
                return initialCost;
            } else {
                // If the supply is 0 and the amount is greater than 1, calculate the cost
                uint256 sum = (amount - 1) * (amount) * (2 * (amount - 1) + 1) / 6;
                return (sum * initialCost) / scalingFactor + initialCost * amount;
            }
        } else {
            // if the supply is greater than 0
            uint256 sum1 = (supply - 1) * (supply) * (2 * (supply - 1) + 1) / 6;
            uint256 sum2 = (supply - 1 + amount) * (supply + amount) * (2 * (supply - 1 + amount) + 1) / 6;
            uint256 totalSum = sum2 - sum1;
            return purchaseCost = (totalSum * initialCost / (scalingFactor)) + initialCost * amount;
        }
    }

    /// @notice Returns the sale value for a given amount (in the main token) as a conversion into the reserve token.
    /// @param supply token total supply
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in basis points, 1-10000
    /// @param amount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function _calculateExpTokenBasedSaleReturn(
        uint256 supply,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 saleReturn) {
        // Validate Input
        if (initialCost == 0 || scalingFactor == 0 || scalingFactor > MAX_SCALE || amount > supply) {
            revert ExpTokenBasedFormula__InvalidInput();
        }

        // If the amount or supply is 0, return 0
        if (supply == 0 || amount == 0) {
            return 0;
        }

        // If the supply is equal to the amount, return the total value
        if (supply == amount) {
            uint256 sum = (supply - 1) * supply * (2 * (supply - 1) + 1) / 6;
            return (sum * initialCost / scalingFactor) + initialCost * amount;
        } else {
            // If the supply is greater than the amount, calculate the value
            uint256 sum1 = ((supply - amount) - 1) * ((supply - amount)) * (2 * ((supply - amount) - 1) + 1) / 6;
            uint256 sum2 = (supply - 1) * (supply) * (2 * (supply - 1) + 1) / 6;
            uint256 totalSum = sum2 - sum1;
            return saleReturn = (totalSum * initialCost / (scalingFactor)) + initialCost * amount;
        }
    }
}
