//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {console} from "forge-std/console.sol";

abstract contract LinearFormula {
    // Max reserve ratio in parts per million
    uint32 private constant MAX_SCALE = 100000000; // 10000%
    uint32 private constant PURE_LINEAR_SCALE = 1000000; // 100%
    // 1 ether
    uint256 private constant WAD = 10 ** 18;

    function _calculateLinearPurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        uint256 remainingDeposit = _depositAmount;
        // Determine the current token threshold
        uint256 currentToken = (_supply / WAD) + 1;
        uint256 currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
        // Determine the current token balance

        uint256 currentTokenBalance = _totalCostOfTokens(currentToken, _scalingFactor, _initialPrice) - _reserveBalance;
        uint256 currentFragment;

        if (remainingDeposit <= currentTokenBalance) {
            currentFragment = remainingDeposit * WAD / currentTokenCost;
            remainingDeposit = 0;
            return currentFragment;
        }

        remainingDeposit -= currentTokenBalance;
        uint256 previousTokenCost = currentTokenCost;
        purchaseReturn += currentTokenBalance * WAD / currentTokenCost;
        currentToken++;
        currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);

        while (remainingDeposit >= currentTokenCost && currentTokenCost != previousTokenCost) {
            remainingDeposit -= currentTokenCost;
            previousTokenCost = currentTokenCost;
            currentToken++;
            currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
            purchaseReturn += WAD;
        }

        if (remainingDeposit > 0) {
            currentFragment = remainingDeposit * WAD / currentTokenCost;
            remainingDeposit = 0;
            purchaseReturn += currentFragment;
        }

        return purchaseReturn;
    }

    function _calculateLinearSaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _sellAmount
    ) internal pure returns (uint256 saleReturn) {}

    function _totalCostOfTokens(uint256 _currentToken, uint256 _scalingFactor, uint256 _initialPrice)
        internal
        pure
        returns (uint256)
    {
        return ((_currentToken * (_currentToken + 1) * _initialPrice) * _scalingFactor / 2) / PURE_LINEAR_SCALE;
    }

    function _currentTokenCost(uint256 _currentToken, uint256 _scalingFactor, uint256 _initialPrice)
        internal
        pure
        returns (uint256 currentTokenCost)
    {
        return _initialPrice * _currentToken * _scalingFactor / PURE_LINEAR_SCALE;
    }
}
