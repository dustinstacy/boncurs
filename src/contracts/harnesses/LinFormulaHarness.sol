//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinFormula} from "../utils/LinFormula.sol";

/// @notice Used only for testing the LinFormula contract
contract LinFormulaHarness is LinFormula {
    function calculatePurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) external pure returns (uint256 purchaseReturn) {
        purchaseReturn =
            _calculateLinPurchaseReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }

    function calculateSaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialReserve,
        uint32 _scalingFactor,
        uint256 _sellAmount
    ) external pure returns (uint256 saleReturn) {
        saleReturn = _calculateLinSaleReturn(_supply, _reserveBalance, _initialReserve, _scalingFactor, _sellAmount);
    }

    function currentTokenCost(uint256 _currentToken, uint32 _scalingFactor, uint256 _initialPrice)
        external
        pure
        returns (uint256 tokenCost)
    {
        tokenCost = _currentTokenCost(_currentToken, _scalingFactor, _initialPrice);
    }

    function totalCostOfTokens(uint256 _currentToken, uint32 _scalingFactor, uint256 _initialPrice)
        external
        pure
        returns (uint256 totalCost)
    {
        totalCost = _totalCostOfTokens(_currentToken, _scalingFactor, _initialPrice);
    }

    function calculateTokenCount(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) external pure returns (uint256 tokenCount) {
        tokenCount = _calculateTokenCount(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }

    function generalSqrt(uint256 x) external pure returns (uint256 result) {
        result = _generalSqrt(x);
    }

    function optimalSqrt(uint256 x) external pure returns (uint256 result) {
        result = _optimalSqrt(x);
    }

    function getLength(uint256 x) external pure returns (uint256 result) {
        result = _getLength(x);
    }
}
