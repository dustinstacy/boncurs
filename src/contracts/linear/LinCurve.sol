//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinFormula} from "./LinFormula.sol";

contract LinCurve is LinFormula {
    function getPurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        purchaseReturn = _calculateLinPurchaseReturn(supply, reserveBalance, initialCost, scalingFactor, depositAmount);
    }

    function getSaleReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 sellAmount
    ) internal pure returns (uint256 saleReturn) {
        saleReturn = _calculateLinSaleReturn(supply, reserveBalance, initialCost, scalingFactor, sellAmount);
    }
}
