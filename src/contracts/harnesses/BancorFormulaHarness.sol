//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "../utils/BancorFormula.sol";

contract BancorFormulaHarness is BancorFormula {
    function calculatePurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint32 _reserveRatio,
        uint256 _depositAmount
    ) external view returns (uint256 purchaseReturn) {
        purchaseReturn = _calculateBancorFormulaPurchaseReturn(_supply, _reserveBalance, _reserveRatio, _depositAmount);
    }

    function calculateSaleReturn(uint256 _supply, uint256 _reserveBalance, uint32 _reserveRatio, uint256 _sellAmount)
        external
        view
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBancorFormulaSaleReturn(_supply, _reserveBalance, _reserveRatio, _sellAmount);
    }

    function power_Harness(uint256 _baseN, uint256 _baseD, uint32 _expN, uint32 _expD)
        external
        view
        returns (uint256 result, uint256 precision)
    {
        (result, precision) = _power(_baseN, _baseD, _expN, _expD);
    }

    function generalLog_Harness(uint256 x) external pure returns (uint256 result) {
        result = _generalLog(x);
    }

    function floorLog2_Harness(uint256 _n) external pure returns (uint8 result) {
        result = _floorLog2(_n);
    }

    function findPositionInMaxExpArray_Harness(uint256 _x) external view returns (uint8 position) {
        position = _findPositionInMaxExpArray(_x);
    }

    function generalExp_Harness(uint256 x, uint8 precision) external pure returns (uint256 result) {
        result = _generalExp(x, precision);
    }

    function optimalLog_Harness(uint256 x) external pure returns (uint256 result) {
        result = _optimalLog(x);
    }

    function optimalExp_Harness(uint256 x) external pure returns (uint256 result) {
        result = _optimalExp(x);
    }
}
