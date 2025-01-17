//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "./utils/BancorFormula.sol";
import {LinearFormula} from "./utils/LinearFormula.sol";
import {LinearFormulaV2} from "./utils/LinearFormulaV2.sol";

abstract contract Boncurs is BancorFormula, LinearFormula, LinearFormulaV2 {
    function _getBancorFormulaPurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint32 _reserveRatio,
        uint256 _depositAmount
    ) internal view returns (uint256 purchaseReturn) {
        return _calculateBancorFormulaPurchaseReturn(_supply, _reserveBalance, _reserveRatio, _depositAmount);
    }

    function _getBancorFormulaSaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint32 _reserveRatio,
        uint256 _sellAmount
    ) internal view returns (uint256 saleReturn) {
        return _calculateBancorFormulaSaleReturn(_supply, _reserveBalance, _reserveRatio, _sellAmount);
    }

    function _getLinearFormulaPurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        return _calculateLinearPurchaseReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }

    function _getLinearFormulaSaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 saleReturn) {
        return _calculateLinearSaleReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }

    function _getLinearFormulaV2PurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        return _calculateLinearV2PurchaseReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }

    function _getLinearFormulaV2SaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 saleReturn) {
        return _calculateLinearV2SaleReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }
}
