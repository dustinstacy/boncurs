//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinTokenBasedFormula} from "./LinTokenBasedFormula.sol";

contract LinTokenBasedCurve is LinTokenBasedFormula {
    function getPurchaseReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
        internal
        pure
        returns (uint256 purchaseReturn)
    {
        purchaseReturn = _calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);
    }

    function getSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
        internal
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);
    }
}
