// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BoncursFormula} from "../../contracts/experimental/utils/BoncursFormula.sol";

/// @notice Used only for testing the BoncursFormula contract
contract BoncursFormulaHarness is BoncursFormula {
    function calculateBoncursPurchaseCost(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) external pure returns (uint256 totalCost) {
        totalCost = _calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);
    }

    function calculateBoncursSaleReturn(uint256 supply, uint256 reserveBalance, uint256 sellAmount)
        external
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBoncursSaleReturn(supply, reserveBalance, sellAmount);
    }
}
