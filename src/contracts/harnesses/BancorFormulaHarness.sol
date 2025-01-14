//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "src/contracts/utils/BancorFormula.sol";
import {console} from "forge-std/console.sol";

contract BancorFormulaHarness is BancorFormula {
    uint32 private constant MAX_RATIO = 1000000;

    function calculatePurchaseReturn_Copy(
        uint256 _supply,
        uint256 _reserveBalance,
        uint32 _reserveRatio,
        uint256 _depositAmount
    ) external view returns (uint256 purchaseReturn) {
        if (_supply == 0 || _reserveBalance == 0 || _reserveRatio == 0 || _reserveRatio > MAX_RATIO) {
            revert InvalidInput();
        }

        if (_depositAmount == 0) {
            return 0;
        }

        if (_reserveRatio == MAX_RATIO) {
            return (_supply * _depositAmount) / _reserveBalance;
        }

        uint256 newReserveBalance = (_depositAmount + _reserveBalance);
        (uint256 result, uint256 precision) = power(newReserveBalance, _reserveBalance, _reserveRatio, MAX_RATIO);
        uint256 temp = (_supply * result) >> precision;
        return temp - _supply;
    }

    function calculateSaleReturn_Copy(
        uint256 _supply,
        uint256 _reserveBalance,
        uint32 _reserveRatio,
        uint256 _sellAmount
    ) external view returns (uint256 saleReturn) {
        if (
            _supply == 0 || _reserveBalance == 0 || _reserveRatio == 0 || _reserveRatio > MAX_RATIO
                || _sellAmount > _supply
        ) {
            revert InvalidInput();
        }

        if (_sellAmount == 0) {
            return 0;
        }

        if (_sellAmount == _supply) {
            return _reserveBalance;
        }

        if (_reserveRatio == MAX_RATIO) {
            return (_reserveBalance * _sellAmount) / _supply;
        }

        uint256 newSupply = _supply - _sellAmount;
        (uint256 result, uint256 precision) = power(_supply, newSupply, MAX_RATIO, _reserveRatio);
        uint256 temp1 = (_reserveBalance * result);
        uint256 temp2 = _reserveBalance << precision;
        return (temp1 - temp2) / result;
    }

    function power_Harness(uint256 _baseN, uint256 _baseD, uint32 _expN, uint32 _expD)
        external
        view
        returns (uint256 result, uint256 precision)
    {
        return super.power(_baseN, _baseD, _expN, _expD);
    }

    function generalLog_Harness(uint256 x) external pure returns (uint256 result) {
        return super.generalLog(x);
    }

    function floorLog2_Harness(uint256 _n) external pure returns (uint256 result) {
        return super.floorLog2(_n);
    }

    function findPositionInMaxExpArray_Harness(uint256 _x) external view returns (uint8 position) {
        return super.findPositionInMaxExpArray(_x);
    }

    function generalExp_Harness(uint256 x, uint8 precision) external pure returns (uint256 result) {
        return super.generalExp(x, precision);
    }

    function optimalLog_Harness(uint256 x) external pure returns (uint256 result) {
        console.log("optimalLog_Harness");
        console.log(x);
        return super.optimalLog(x);
    }

    function optimalExp_Harness(uint256 x) external pure returns (uint256 result) {
        return super.optimalExp(x);
    }
}
