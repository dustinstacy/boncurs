// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinTokenBasedFormula} from "../../contracts/linear/utils/LinTokenBasedFormula.sol";

/// @notice Used only for testing the LinTokenBasedFormula contract
contract LinTokenBasedFormulaHarness is LinTokenBasedFormula {
    function calculateLinTokenBasedPurchaseCost(
        uint256 supply,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) public pure returns (uint256 totalCost) {
        totalCost = _calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);
    }

    function calculateLinTokenBasedSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
        public
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);
    }
}
