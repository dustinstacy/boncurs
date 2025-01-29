//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ExpTokenBasedFormula} from "./ExpTokenBasedFormula.sol";

contract ExpTokenBasedCurve is ExpTokenBasedFormula {
    function getPurchaseReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 depositAmount)
        internal
        pure
        returns (uint256 purchaseReturn)
    {
        purchaseReturn = _calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, depositAmount);
    }

    function getSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 sellAmount)
        internal
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, sellAmount);
    }
}
