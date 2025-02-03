// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @title  BoncursFormula
/// @notice This contract provides functions for calculating the purchase and sale return values on a uinque curve using a scaling factor.
///     The formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return.
/// @notice This formula is a custom curve that sees an initial diminishing return on the cost to mint a token, but as the supply increases
///     and the reserve balance grows, the value of the token increases and cannot go down. Used to reward early adopters and incentivize
///     the holding of the token. Also, with the way the curve tends to move towards flat over time, it does not punish late adopters.
abstract contract BoncursFormula {
    ///@dev Minimum scale in basis points. Prevents loss of value.
    uint32 constant MIN_SCALE = 10000; // 100%
    ///@dev Maximum scale in basis points.
    uint32 constant MAX_SCALE = 1000000; // 10000%
    ///@dev Wei as decimal precision for calculations.
    uint256 constant WAD = 10 ** 18;

    // Custom errors
    error BoncursFormula__InvalidInput();

    /// @notice Returns the purchase cost for a given conversion (in the reserve token) for a desired amount (in the main token).
    /// @param supply token total supply
    /// @param reserveBalance current balance of the reserve token
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in basis points, 1-10000
    /// @param amount amount of tokens to purchase
    /// @return purchaseCost cost of the conversion
    function _calculateBoncursPurchaseCost(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 purchaseCost) {
        // Validate input
        if (initialCost == 0 || scalingFactor < MIN_SCALE || scalingFactor > MAX_SCALE) {
            revert BoncursFormula__InvalidInput();
        }

        // If the amount is 0, return 0
        if (amount == 0) {
            return 0;
        }

        // If the supply is 0, start with initialCost. Continue on if the amount is greater than 1
        if (supply == 0) {
            purchaseCost += initialCost;
            reserveBalance += purchaseCost;
            amount--;
            supply++;
        }

        // Calculate the cost to mint the desired amount of tokens
        // Need to iterate as the value is dynamic with each mint
        for (uint256 i = 0; i < amount; i++) {
            uint256 value = reserveBalance * scalingFactor / supply;
            purchaseCost += value / MIN_SCALE;
            reserveBalance += purchaseCost;
            supply++;
        }

        return purchaseCost;
    }

    /// @notice Returns the sale value for a given amount (in the main token) as a conversion into the reserve token.
    /// @param supply token total supply
    /// @param reserveBalance current balance of the reserve token
    /// @param amount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function _calculateBoncursSaleReturn(uint256 supply, uint256 reserveBalance, uint256 amount)
        internal
        pure
        returns (uint256)
    {
        // supply, reserveBalance, and amount must be greater than 0
        if (supply == 0 || reserveBalance == 0 || amount == 0) {
            return 0;
        }

        // Calculate the return for the desired amount of tokens
        uint256 value = reserveBalance * amount / supply;
        return value / WAD;
    }
}
