//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * @title  BoncursFormula
 * @author Dustin Stacy
 * @notice Provides functions for calculating the purchase and sale return values on a uinque curve using a scaling factor
 *         This formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return
 *
 *         This formula is a custom curve that sees an initial diminishing return on the cost to mint a token, but as the supply increases
 *         and the reserve balance grows, the value of the token increases and cannot go down. Used to reward early adopters and incentivize
 *         the holding of the token. Also, with the way the curve tends to move towards flat over time, it does not punish late adopters.
 *
 *         Great for a token that is meant to be held and not traded often or as a community engagement token.
 *         i.e. staking tokens, governance tokens, group membership tokens, game assets, etc.
 */
abstract contract BoncursFormula {
    // Minimum scale in basis points. Prevents loss of value
    uint32 constant MIN_SCALE = 10000; // 100%
    // Maximum scale in basis points
    uint256 constant MAX_SCALE = 1000000; // 10000%
    // Decimal precision (1 Ether)
    uint256 constant WAD = 10 ** 18;

    // Custom errors
    error BoncursFormula__InvalidInput();

    /**
     *  @dev given a token supply, reserve balance, initial cost, scaling factor and a desired amount (in the main token),
     *       calculates the cost for a given conversion (in the reserve token)
     *
     *     @param supply token total supply
     *     @param reserveBalance reserve balance of the token
     *     @param initialCost initial cost of the token
     *     @param scalingFactor scaling factor for the token
     *     @param amount amount of tokens to purchase
     *
     *     @return costToMint cost of the conversion
     */
    function _calculateBoncursPurchaseCost(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 costToMint) {
        // Validate Input
        if (initialCost == 0 || scalingFactor < MIN_SCALE || scalingFactor > MAX_SCALE) {
            revert BoncursFormula__InvalidInput();
        }

        // If the amount is 0, return 0
        if (amount == 0) {
            return 0;
        }

        // If the supply is 0. Continue on if the amount is greater than 1
        if (supply == 0) {
            costToMint += initialCost;
            reserveBalance += costToMint;
            amount--;
            supply++;
        }

        // Calculate the cost to mint the desired amount of tokens
        // Need to iterate as the value is dynamic with each mint
        for (uint256 i = 0; i < amount; i++) {
            uint256 value = reserveBalance / supply;
            costToMint += value * scalingFactor / MIN_SCALE;
            reserveBalance += costToMint;
            supply++;
        }

        return costToMint;
    }

    /**
     *  @dev given a token supply, reserve balance, and a desired sell amount (in the main token),
     *       calculates the return for a given conversion (in the reserve token)
     *
     *     @param supply token total supply
     *     @param reserveBalance reserve balance of the token
     *     @param amount amount of tokens to sell
     *
     *     @return returnToBurn return of the conversion
     */
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
        uint256 value = reserveBalance / supply;
        return (value * amount) / WAD;
    }
}
