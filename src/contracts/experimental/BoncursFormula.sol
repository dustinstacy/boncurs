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
    uint32 constant MIN_SCALE = 10000; // 100%
    uint256 constant MAX_SCALE = 1000000; // 10000%
    uint256 constant WAD = 10 ** 18;

    function _calculateBoncursPurchaseCost(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 costToMint) {
        if (supply == 0) {
            costToMint += initialCost;
            reserveBalance += costToMint;
            amount--;
            supply++;
        }

        for (uint256 i = 0; i < amount; i++) {
            uint256 value = reserveBalance / supply;
            costToMint += value * scalingFactor / MIN_SCALE;
            reserveBalance += costToMint;
            supply++;
        }

        return costToMint;
    }

    function _calculateBoncursSaleReturn(uint256 supply, uint256 reserveBalance, uint256 sellAmount)
        internal
        pure
        returns (uint256)
    {
        uint256 value = reserveBalance / supply;
        return (value * sellAmount) / WAD;
    }
}
