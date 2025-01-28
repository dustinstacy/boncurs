//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "./utils/BancorFormula.sol";
import {LinFormula} from "./utils/LinFormula.sol";

abstract contract Boncurs is BancorFormula, LinFormula {
    function _getExpPurchaseReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 depositAmount)
        internal
        view
        returns (uint256 purchaseReturn)
    {
        return _calculateBancorFormulaPurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
    }

    function _getExpSaleReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 _sellAmount)
        internal
        view
        returns (uint256 saleReturn)
    {
        return _calculateBancorFormulaSaleReturn(supply, reserveBalance, reserveRatio, _sellAmount);
    }

    function _getLinPurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialPrice,
        uint32 scalingFactor,
        uint256 depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        return _calculateLinPurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);
    }

    function _getLinSaleReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialPrice,
        uint32 scalingFactor,
        uint256 depositAmount
    ) internal pure returns (uint256 saleReturn) {
        return _calculateLinSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);
    }
}
