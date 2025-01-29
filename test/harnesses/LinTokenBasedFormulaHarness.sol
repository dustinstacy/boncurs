//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinTokenBasedFormula} from "../../src/contracts/linear/LinTokenBasedFormula.sol";

/// @notice Used only for testing the LinTokenBasedFormula contract
contract LinTokenBasedFormulaHarness is LinTokenBasedFormula {
    function calculateLinTokenBasedPurchaseCost(
        uint256 supply,
        uint256 initialCost,
        uint256 scalingFactor,
        uint256 amount
    ) public pure returns (uint256 totalCost) {
        totalCost = _calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);
    }

    function calculateLinTokenBasedSaleReturn(
        uint256 supply,
        uint256 initialCost,
        uint256 scalingFactor,
        uint256 amount
    ) public pure returns (uint256 saleReturn) {
        saleReturn = _calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);
    }
}
