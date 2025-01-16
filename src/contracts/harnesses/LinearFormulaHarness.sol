//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinearFormula} from "../utils/LinearFormula.sol";

contract LinearFormulaHarness is LinearFormula {
    function calculatePurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialReserve,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) external pure returns (uint256 purchaseReturn) {
        purchaseReturn =
            _calculateLinearPurchaseReturn(_supply, _reserveBalance, _initialReserve, _scalingFactor, _depositAmount);
    }

    function calculateSaleReturn(uint256 _supply, uint256 _reserveBalance, uint256 _initialReserve, uint256 _sellAmount)
        external
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateLinearSaleReturn(_supply, _reserveBalance, _initialReserve, _sellAmount);
    }

    function totalCostOfTokens(uint256 _currentToken, uint256 _scalingFactor, uint256 _initialReserve)
        external
        pure
        returns (uint256)
    {
        return _totalCostOfTokens(_currentToken, _scalingFactor, _initialReserve);
    }

    function currentTokenCost(uint256 _currentToken, uint256 _scalingFactor, uint256 _initialReserve)
        external
        pure
        returns (uint256)
    {
        return _currentTokenCost(_currentToken, _scalingFactor, _initialReserve);
    }
}
