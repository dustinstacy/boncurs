// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinFormula} from "../../contracts/linear/utils/LinFormula.sol";

/// @notice Used only for testing the LinFormula contract
contract LinFormulaHarness is LinFormula {
    function calculatePurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialPrice,
        uint32 scalingFactor,
        uint256 depositAmount
    ) external pure returns (uint256 purchaseReturn) {
        purchaseReturn = _calculateLinPurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);
    }

    function calculateSaleReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialReserve,
        uint32 scalingFactor,
        uint256 sellAmount
    ) external pure returns (uint256 saleReturn) {
        saleReturn = _calculateLinSaleReturn(supply, reserveBalance, initialReserve, scalingFactor, sellAmount);
    }

    function currentTokenCost(uint256 currentToken, uint32 scalingFactor, uint256 initialPrice)
        external
        pure
        returns (uint256 tokenCost)
    {
        tokenCost = _currentTokenCost(currentToken, scalingFactor, initialPrice);
    }

    function totalCostOfTokens(uint256 currentToken, uint32 scalingFactor, uint256 initialPrice)
        external
        pure
        returns (uint256 totalCost)
    {
        totalCost = _totalCostOfTokens(currentToken, scalingFactor, initialPrice);
    }

    function calculateTokenCount(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialPrice,
        uint32 scalingFactor,
        uint256 depositAmount
    ) external pure returns (uint256 tokenCount) {
        tokenCount = _calculateTokenCount(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);
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
