//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

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
