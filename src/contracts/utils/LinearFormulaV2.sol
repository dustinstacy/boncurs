//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinearFormula} from "./LinearFormula.sol";
import {console} from "forge-std/console.sol";

contract LinearFormulaV2 is LinearFormula {
    // Max reserve ratio in parts per million
    uint32 private constant MAX_SCALE = 100000000; // 10000%
    uint32 private constant PURE_LINEAR_SCALE = 1000000; // 100%
    // 1 ether
    uint256 private constant WAD = 10 ** 18;

    function _calculateLinearV2PurchaseReturn(
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
        purchaseReturn += currentTokenBalance * WAD / currentTokenCost;
        currentToken++;
        currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);

        uint256 tokensToBuy = calculateTokenCount(_depositAmount, _reserveBalance, _initialPrice, currentToken);
        uint256 newReserveBalance = _reserveBalance + currentTokenBalance;
        uint256 tokensToBuyCost =
            _totalCostOfTokens(currentToken + tokensToBuy - 1, _scalingFactor, _initialPrice) - newReserveBalance;

        remainingDeposit -= tokensToBuyCost;
        purchaseReturn += tokensToBuy * WAD;

        if (remainingDeposit > 0) {
            currentToken += tokensToBuy;
            currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
            while (remainingDeposit >= currentTokenCost) {
                remainingDeposit -= currentTokenCost;
                purchaseReturn += WAD;
                currentToken++;
                currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
            }

            if (remainingDeposit < currentTokenCost && remainingDeposit > 0) {
                purchaseReturn += remainingDeposit * WAD / currentTokenCost;
            }

            remainingDeposit = 0;
        }

        return purchaseReturn;
    }

    function _calculateLinearV2SaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _sellAmount
    ) internal pure returns (uint256 saleReturn) {}

    function calculateTokenCount(
        uint256 _depositAmount,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint256 _currentToken
    ) internal pure returns (uint256 tokenThreshold) {
        // Calculate the value inside the square root
        uint256 term = (2 * (_depositAmount + _reserveBalance) + WAD) / _initialPrice;
        uint256 sqrtTerm;

        // Take the square root
        if (term < 106) {
            sqrtTerm = optimalSqrt(term);
        } else {
            sqrtTerm = generalSqrt(term);
        }

        tokenThreshold = sqrtTerm - _currentToken;
    }

    // as proposed in EIP-7054
    function generalSqrt(uint256 x) internal pure returns (uint128) {
        if (x == 0) {
            return 0;
        } else {
            uint256 xx = x;
            uint256 r = 1;
            if (xx >= 0x100000000000000000000000000000000) {
                xx >>= 128;
                r <<= 64;
            }
            if (xx >= 0x10000000000000000) {
                xx >>= 64;
                r <<= 32;
            }
            if (xx >= 0x100000000) {
                xx >>= 32;
                r <<= 16;
            }
            if (xx >= 0x10000) {
                xx >>= 16;
                r <<= 8;
            }
            if (xx >= 0x100) {
                xx >>= 8;
                r <<= 4;
            }
            if (xx >= 0x10) {
                xx >>= 4;
                r <<= 2;
            }
            if (xx >= 0x8) r <<= 1;
            r = (r + x / r) >> 1;
            r = (r + x / r) >> 1;
            r = (r + x / r) >> 1;
            r = (r + x / r) >> 1;
            r = (r + x / r) >> 1;
            r = (r + x / r) >> 1;
            r = (r + x / r) >> 1;
            uint256 r1 = x / r;
            return uint128(r < r1 ? r : r1);
        }
    }

    // Basic Bablyonian method
    function optimalSqrt(uint256 y) public pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            // instead of returning 1, we add 1 to account for the current token when returning a root value less than 2;
            z = 2;
        }
    }
}
