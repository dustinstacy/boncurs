//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "./utils/BancorFormula.sol";
import {LinFormula} from "./utils/LinFormula.sol";

abstract contract Boncurs is BancorFormula, LinFormula {
    function _getExpPurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint32 _reserveRatio,
        uint256 _depositAmount
    ) internal view returns (uint256 purchaseReturn) {
        return _calculateBancorFormulaPurchaseReturn(_supply, _reserveBalance, _reserveRatio, _depositAmount);
    }

    function _getExpSaleReturn(uint256 _supply, uint256 _reserveBalance, uint32 _reserveRatio, uint256 _sellAmount)
        internal
        view
        returns (uint256 saleReturn)
    {
        return _calculateBancorFormulaSaleReturn(_supply, _reserveBalance, _reserveRatio, _sellAmount);
    }

    function _getLinPurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        return _calculateLinPurchaseReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }

    function _getLinSaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 saleReturn) {
        return _calculateLinSaleReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }
}
