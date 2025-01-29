//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BoncursFormula} from "./BoncursFormula.sol";

abstract contract BoncursCurve is BoncursFormula {
    function getPurchaseCost(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 costToMint) {
        costToMint = _calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);
    }

    function getSaleReturn(uint256 supply, uint256 reserveBalance, uint256 sellAmount)
        internal
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBoncursSaleReturn(supply, reserveBalance, sellAmount);
    }
}
