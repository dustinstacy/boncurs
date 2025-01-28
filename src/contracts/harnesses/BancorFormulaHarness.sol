//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "../utils/BancorFormula.sol";

/// @notice Used only for testing the BancorFormula contract
contract BancorFormulaHarness is BancorFormula {
    function calculatePurchaseReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 depositAmount)
        external
        view
        returns (uint256 purchaseReturn)
    {
        purchaseReturn = _calculateBancorFormulaPurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
    }

    function calculateSaleReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 sellAmount)
        external
        view
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBancorFormulaSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
    }

    function power(uint256 baseN, uint256 baseD, uint32 expN, uint32 expD)
        external
        view
        returns (uint256 result, uint256 precision)
    {
        (result, precision) = _power(baseN, baseD, expN, expD);
    }

    function generalLog(uint256 x) external pure returns (uint256 result) {
        result = _generalLog(x);
    }

    function floorLog2(uint256 x) external pure returns (uint8 result) {
        result = _floorLog2(x);
    }

    function findPositionInMaxExpArray(uint256 x) external view returns (uint8 position) {
        position = _findPositionInMaxExpArray(x);
    }

    function generalExp(uint256 x, uint8 precision) external pure returns (uint256 result) {
        result = _generalExp(x, precision);
    }

    function optimalLog(uint256 x) external pure returns (uint256 result) {
        result = _optimalLog(x);
    }

    function optimalExp(uint256 x) external pure returns (uint256 result) {
        result = _optimalExp(x);
    }
}
