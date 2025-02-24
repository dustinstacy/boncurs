// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @title  LinFormula
/// @notice This contract provides functions for calculating the purchase and sale return values on a linear curve using a scaling factor.
///     The formula converts a given reserve token amount into a token return and the sale of a token amount into a reserve token return.
abstract contract LinFormula {
    /// @dev Value that represents the point at which the optimal function approximations are still effective
    uint8 private constant OPTIMAL_TERM_MAX_VAL = 0x6a;
    /// @dev Max scaling factor in parts per million
    uint32 private constant MAX_SCALE = 100000000; // 10000%
    /// @dev 1:1 scaling factor in parts per million
    uint32 private constant PURE_LINEAR_SCALE = 1000000; // 100%
    /// @dev Wei as decimal precision for calculations
    uint256 private constant WAD = 10 ** 18;

    // Custom errors
    error LinFormula__InvalidInput();

    /// @notice Returns the purchase value for a given amount (in the reserve token) as a conversion into the main token.
    /// @param supply token total supply
    /// @param reserveBalance balance of the reserve token
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in ppm, 1-1000000
    /// @param depositAmount deposit amount, in reserve token
    ///  @return purchaseReturn return amount
    function _calculateLinPurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        // Validate input
        if (initialCost == 0 || scalingFactor == 0 || scalingFactor > MAX_SCALE) {
            revert LinFormula__InvalidInput();
        }

        // If the deposit amount is 0, return 0
        if (depositAmount == 0) {
            return 0;
        }

        // Determine the current token number, cost, and balance remaining until the next token
        uint256 currentToken = (supply / WAD) + 1;
        uint256 currentTokenCost = _currentTokenCost(currentToken, scalingFactor, initialCost);
        uint256 currentTokenBalance = _totalCostOfTokens(currentToken, scalingFactor, initialCost) - reserveBalance;
        uint256 currentFragment;

        // If the deposit amount is less than the current token balance, calculate the return based on the current token cost
        uint256 remainingDeposit = depositAmount;
        if (remainingDeposit <= currentTokenBalance) {
            currentFragment = remainingDeposit * WAD / currentTokenCost;
            remainingDeposit = 0;
            return currentFragment;
        }

        // If the deposit amount is greater than the current token balance, calibrate the variables to move to the next token
        remainingDeposit -= currentTokenBalance;
        purchaseReturn += currentTokenBalance * WAD / currentTokenCost;
        currentToken++;
        currentTokenCost = _currentTokenCost(currentToken, scalingFactor, initialCost);
        uint256 newReserveBalance = reserveBalance + currentTokenBalance;

        // Determine the amount of whole tokens the deposit can still cover and their cost
        uint256 tokensToBuy =
            _calculateTokenCount(depositAmount, reserveBalance, initialCost, scalingFactor, currentToken);
        uint256 tokensToBuyCost =
            _totalCostOfTokens(currentToken + tokensToBuy - 1, scalingFactor, initialCost) - newReserveBalance;

        // Calibrate the variables after determining the amount of whole tokens the deposit can still cover
        remainingDeposit -= tokensToBuyCost;
        purchaseReturn += tokensToBuy * WAD;

        // If there is a remainder, calculate the final addition to the return based on the new current token cost
        if (remainingDeposit > 0) {
            currentToken += tokensToBuy;
            currentTokenCost = _currentTokenCost(currentToken, scalingFactor, initialCost);
            while (remainingDeposit >= currentTokenCost) {
                remainingDeposit -= currentTokenCost;
                purchaseReturn += WAD;
                currentToken++;
                currentTokenCost = _currentTokenCost(currentToken, scalingFactor, initialCost);
            }
            if (remainingDeposit < currentTokenCost && remainingDeposit > 0) {
                purchaseReturn += remainingDeposit * WAD / currentTokenCost;
            }
            remainingDeposit = 0;
        }

        return purchaseReturn;
    }

    /// @notice Returns the sale value for a given amount (in the main token) as a conversion into the reserve token.
    /// @param supply token total supply
    /// @param reserveBalance balance of the reserve token
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in ppm, 1-1000000
    /// @param sellAmount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function _calculateLinSaleReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 sellAmount
    ) internal pure returns (uint256 saleReturn) {
        // Validate input
        if (initialCost == 0 || scalingFactor == 0 || scalingFactor > MAX_SCALE || sellAmount > supply) {
            revert LinFormula__InvalidInput();
        }

        // If the sell amount is 0, return 0
        if (sellAmount == 0) {
            return 0;
        }

        // If the sell amount is equal to the total supply, return the reserve balance
        if (sellAmount == supply) {
            return reserveBalance;
        }

        // Determine the current token number, cost, balance, and fragment
        uint256 currentToken = (supply / WAD) + 1;
        uint256 currentTokenCost = _currentTokenCost(currentToken, scalingFactor, initialCost);
        uint256 currentTokenBalance = reserveBalance - _totalCostOfTokens(currentToken - 1, scalingFactor, initialCost);
        uint256 currentFragment = (currentTokenBalance * WAD / currentTokenCost);

        // If the sell amount is less than the current token fragment, calculate the return based on the current token cost
        uint256 remainingSellAmount = sellAmount;
        if (remainingSellAmount <= currentFragment) {
            saleReturn += remainingSellAmount * currentTokenCost / WAD;
            saleReturn = saleReturn * WAD / WAD;
            remainingSellAmount = 0;
            return saleReturn;
        }

        // If the sell amount is greater than the current token fragment, calibrate the variables to move to the previous token
        remainingSellAmount -= currentFragment;
        saleReturn += currentFragment * currentTokenCost / WAD;
        currentToken--;

        // Calculate the value of whole tokens left in the sale
        if (remainingSellAmount >= WAD) {
            uint256 tokensToSell = remainingSellAmount / WAD;
            uint256 tokenSellValue = _totalCostOfTokens(currentToken, scalingFactor, initialCost)
                - _totalCostOfTokens(currentToken - tokensToSell, scalingFactor, initialCost);
            saleReturn += tokenSellValue;
            remainingSellAmount -= tokensToSell * WAD;
            currentToken -= tokensToSell;
        }

        // If there is a remainder, calculate the final addition to the return based on the new current token cost
        if (remainingSellAmount > 0) {
            currentTokenCost = _currentTokenCost(currentToken, scalingFactor, initialCost);
            saleReturn += (remainingSellAmount * currentTokenCost) / WAD;
            remainingSellAmount = 0;
        }

        // Calculate the precision of the return to increase accuracy
        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = _getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        // Round the return to the nearest precision
        saleReturn = ((saleReturn * WAD / precision) / WAD) * precision;
        return saleReturn;
    }

    /// @notice Returns the total cost of tokens up to the current token.
    /// @param currentToken current token number
    /// @param scalingFactor scaling factor, represented in ppm, 1-1000000
    /// @param initialCost initial cost of the token
    /// @return totalCost total cost of tokens up to the current token
    function _totalCostOfTokens(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
        internal
        pure
        returns (uint256 totalCost)
    {
        // If the current token is 1, return the initial cost
        if (currentToken == 1) {
            return initialCost;
        } else if (scalingFactor == PURE_LINEAR_SCALE) {
            // If the scaling factor is 1:1, use the linear formula without any adjustments
            totalCost = ((currentToken * (currentToken + 1) * initialCost) * scalingFactor / 2) / PURE_LINEAR_SCALE;
        }

        // Calculate the initial cost adjustment based on the scaling factor
        uint256 initialCostAdjustment = _calculateInitialCostAdjustment(initialCost, scalingFactor);
        // Calculate the raw cost of the tokens up to the current token
        uint256 rawCost = (currentToken * (currentToken + 1) * initialCost) * scalingFactor / 2 / PURE_LINEAR_SCALE;
        // If the scaling factor is greater, add the adjustment, otherwise subtract it from the raw cost
        totalCost =
            (scalingFactor > PURE_LINEAR_SCALE) ? rawCost + initialCostAdjustment : rawCost - initialCostAdjustment;
    }

    /// @notice Returns the cost of the current token.
    /// @param currentToken current token number
    /// @param scalingFactor scaling factor, represented in ppm, 1-1000000
    /// @param initialCost initial cost of the token
    /// @return currentTokenCost current token cost
    function _currentTokenCost(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
        internal
        pure
        returns (uint256 currentTokenCost)
    {
        // If the current token is 1, return the initial cost
        if (currentToken == 1) {
            return initialCost;
        } else if (scalingFactor == PURE_LINEAR_SCALE) {
            // If the scaling factor is 1:1, use the linear formula without any adjustments
            return initialCost * currentToken * scalingFactor / PURE_LINEAR_SCALE;
        }

        // Calculate the initial cost adjustment based on the scaling factor
        uint256 initialCostAdjustment = _calculateInitialCostAdjustment(initialCost, scalingFactor);
        // Calculate the raw cost of the current token
        uint256 rawCost = initialCost * currentToken * scalingFactor / PURE_LINEAR_SCALE;
        // If the scaling factor is greater, subtract the adjustment, otherwise add it to the raw cost
        return (scalingFactor > PURE_LINEAR_SCALE) ? rawCost - initialCostAdjustment : rawCost + initialCostAdjustment;
    }

    /// @notice Returns the initial cost adjustment based on the scaling factor.
    /// @dev Calculates the difference between the initial cost and the incremental value applied to each token after the first.
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in ppm, 1-1000000
    /// @return initialCostAdjustment initial cost adjustment
    function _calculateInitialCostAdjustment(uint256 initialCost, uint32 scalingFactor)
        internal
        pure
        returns (uint256 initialCostAdjustment)
    {
        // Calculate the scaled initial cost
        uint256 scaledInitialCost = initialCost * scalingFactor / PURE_LINEAR_SCALE;
        // If the scaling factor is greater, deduct the initial cost from the scaled initial cost, otherwise subtract the scaled initial cost from the initial cost
        return (scalingFactor > PURE_LINEAR_SCALE) ? scaledInitialCost - initialCost : initialCost - scaledInitialCost;
    }

    /// @notice Returns the amount of whole tokens the deposit can still cover.
    /// @param depositAmount deposit amount, in reserve token
    /// @param reserveBalance balance of the reserve token
    /// @param initialCost initial cost of the token
    /// @param currentToken current token number
    /// @return tokenCount amount of whole tokens the deposit can still cover
    function _calculateTokenCount(
        uint256 depositAmount,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 currentToken
    ) internal pure returns (uint256 tokenCount) {
        // Calculate the value inside the square root of the quadratic formula
        uint256 term = (2 * ((depositAmount + reserveBalance) * scalingFactor) + WAD) / initialCost / scalingFactor;
        term = term * PURE_LINEAR_SCALE / scalingFactor;
        uint256 sqrtTerm;

        // If the term is less than the optimal value, we can use the optimal function for the sqaure root
        // This is computationally more efficient
        if (term < OPTIMAL_TERM_MAX_VAL) {
            //
            sqrtTerm = _optimalSqrt(term);
        } else {
            sqrtTerm = _generalSqrt(term);
        }

        // Calculate the difference to determine the amount of whole tokens the deposit can still cover
        tokenCount = sqrtTerm - currentToken;
    }

    /// @notice Returns the square root of a given value as proposed in EIP-7054.
    /// @param x value to calculate the square root of
    /// @return z square root of the value
    function _generalSqrt(uint256 x) internal pure returns (uint128 z) {
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
            z = uint128(r < r1 ? r : r1);
        }
    }

    /// @notice Returns the square root of a given value using the Babylonian method.
    /// @param y value to calculate the square root of
    /// @return z square root of the value
    function _optimalSqrt(uint256 y) internal pure returns (uint256 z) {
        // If y is greater than 3, calculate the square root using the Babylonian method
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            // return 2 to account for the current token when returning a root value less than 3
            z = 2;
        }
    }

    /// @notice Returns the length of a given number.
    /// @param x number to calculate the length of
    /// @return length length of the number
    function _getLength(uint256 x) internal pure returns (uint256 length) {
        length = 0;
        while (x > 0) {
            x /= 10;
            length++;
        }
        return length;
    }
}
