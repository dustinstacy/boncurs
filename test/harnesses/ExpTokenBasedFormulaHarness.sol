//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ExpTokenBasedFormula} from "../../contracts/exponential/ExpTokenBasedFormula.sol";

/// @notice Used only for testing the ExpTokenBasedFormula contract
contract ExpTokenBasedFormulaHarness is ExpTokenBasedFormula {
    function calculateExpTokenBasedPurchaseCost(
        uint256 supply,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) public pure returns (uint256 totalCost) {
        totalCost = _calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);
    }

    function calculateExpTokenBasedSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
        public
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);
    }
}
