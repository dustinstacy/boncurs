//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @notice Linear formula contract for calculating the purchase and sale return of a token
abstract contract LinFormula {
    // Max scaling factor in parts per million
    uint32 private constant MAX_SCALE = 100000000; // 10000%
    // 1:1 scaling factor in parts per million
    uint32 private constant PURE_LINEAR_SCALE = 1000000; // 100%
    // Decimal precision (1 Ether)
    uint256 private constant WAD = 10 ** 18;

    /// @dev Value that represents the point at which the optimal function approximations are still effective
    uint256 private constant OPTIMAL_TERM_MAX_VAL = 0x6a;

    // Custom error messages
    error LinFormula__InvalidInput();

    /**
     * @dev given a token supply, reserve balance, initial price, scaling factor and a deposit amount (in the reserve token),
     *     calculates the return for a given conversion (in the main token)
     *
     *     If the deposit amount is less than the current token balance, the return is calculated based on the current token cost.
     *     If the deposit amount is greater than the current token balance, the variables are caliabrated to move to the next token.
     *     Then amount of whole tokens the deposit can stil cover is calculated using a sum of an arithmetic series rounded down to the nearest integer.
     *     If there is a remainder, the final addition to the return is calculated based on the new current token cost.
     *
     *     @param _supply            token total supply
     *     @param _reserveBalance    total reserve balance
     *     @param _initialPrice      initial price of the token
     *     @param _scalingFactor     scaling factor for the token
     *     @param _depositAmount     deposit amount, in reserve token
     *
     *     @return purchaseReturn return amount
     */
    function _calculateLinPurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        // Validate input
        if (_initialPrice == 0 || _scalingFactor == 0 || _scalingFactor > MAX_SCALE) {
            revert LinFormula__InvalidInput();
        }

        // If the deposit amount is 0, return 0
        if (_depositAmount == 0) {
            return 0;
        }

        uint256 remainingDeposit = _depositAmount;
        // Determine the current token number
        uint256 currentToken = (_supply / WAD) + 1;
        // Determine the current token cost
        uint256 currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
        // Determine the current token balance remaining
        uint256 currentTokenBalance = _totalCostOfTokens(currentToken, _scalingFactor, _initialPrice) - _reserveBalance;
        uint256 currentFragment;

        // If the deposit amount is less than the current token balance, calculate the return based on the current token cost
        if (remainingDeposit <= currentTokenBalance) {
            // Calculate portion of the token that can be bought
            currentFragment = remainingDeposit * WAD / currentTokenCost;
            remainingDeposit = 0;
            return currentFragment;
        }

        // If the deposit amount is greater than the current token balance, calibrate the variables to move to the next token
        remainingDeposit -= currentTokenBalance;
        purchaseReturn += currentTokenBalance * WAD / currentTokenCost;
        currentToken++;
        currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
        uint256 newReserveBalance = _reserveBalance + currentTokenBalance;

        // Calculate the amount of whole tokens the deposit can still cover using a sum of an arithmetic series rounded down to the nearest integer
        uint256 tokensToBuy = _calculateTokenCount(_depositAmount, _reserveBalance, _initialPrice, currentToken);
        // Calculate the cost of the whole tokens to buy that the deposit can still cover
        uint256 tokensToBuyCost =
            _totalCostOfTokens(currentToken + tokensToBuy - 1, _scalingFactor, _initialPrice) - newReserveBalance;
        // Calibrate the variables after determining the amount of whole tokens the deposit can still cover
        remainingDeposit -= tokensToBuyCost;
        purchaseReturn += tokensToBuy * WAD;

        // If there is a remainder, calculate the final addition to the return based on the new current token cost
        // Accounts for the case where the remaining deposit amount is greater than the current token balance
        if (remainingDeposit > 0) {
            // Calibrate the current token number and cost
            currentToken += tokensToBuy;
            currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
            // Edge case where the remaining deposit amount is less than the current token cost
            // Possible due to rounding down in square root calculation
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

    /**
     * @dev given a token supply, reserve balance, initial price, scaling factor and a sell amount (in the main token),
     *     calculates the return for a given conversion (in the reserve token)
     *
     *     If the sell amount is less than the current token fragment, the return is calculated based on the current token cost.
     *     If the sell amount is greater than the current token fragment, the variables are calibrated to move to the previous token.
     *     Then the amount of whole tokens left in the sale is converted to the reserve token and added to the return.
     *     If there is a remainder, the final addition to the return is calculated based on the new current token cost.
     *
     *     @param _supply            token total supply
     *     @param _reserveBalance    total reserve
     *     @param _initialPrice      initial price of the token
     *     @param _scalingFactor     scaling factor for the token
     *     @param _sellAmount        sell amount, in the token itself
     *
     *
     *    @return saleReturn return amount
     */
    function _calculateLinSaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _sellAmount
    ) internal pure returns (uint256 saleReturn) {
        // Validate input
        if (_initialPrice == 0 || _scalingFactor == 0 || _scalingFactor > MAX_SCALE || _sellAmount > _supply) {
            revert LinFormula__InvalidInput();
        }

        // If the sell amount is 0, return 0
        if (_sellAmount == 0) {
            return 0;
        }

        // If the sell amount is equal to the total supply, return the reserve balance
        if (_sellAmount == _supply) {
            return _reserveBalance;
        }
        uint256 remainingSellAmount = _sellAmount;
        // Determine the current token number
        uint256 currentToken = (_supply / WAD) + 1;
        // Determine the current token cost
        uint256 currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
        // Determine the current token balance remaining
        uint256 currentTokenBalance = _totalCostOfTokens(currentToken, _scalingFactor, _initialPrice) - _reserveBalance;
        // Determine the current token fragment
        uint256 currentFragment = WAD - (currentTokenBalance * WAD / currentTokenCost);

        // If the sell amount is less than the current token fragment, calculate the return based on the current token cost
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

        // Calculate the amount of whole tokens left in the sale
        if (remainingSellAmount >= WAD) {
            uint256 tokensToSell = remainingSellAmount / WAD;
            uint256 tokenSellValue = _totalCostOfTokens(currentToken, _scalingFactor, _initialPrice)
                - _totalCostOfTokens(currentToken - tokensToSell, _scalingFactor, _initialPrice);
            saleReturn += tokenSellValue;
            remainingSellAmount -= tokensToSell * WAD;
            currentToken -= tokensToSell;
        }

        // If there is a remainder, calculate the final addition to the return based on the new current token cost
        if (remainingSellAmount > 0) {
            currentTokenCost = _currentTokenCost(currentToken, _scalingFactor, _initialPrice);
            saleReturn += (remainingSellAmount * currentTokenCost) / WAD;
            remainingSellAmount = 0;
        }

        uint256 precision;
        if (saleReturn > WAD) {
            uint256 length = _getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        // Round the return to the nearest precision
        saleReturn = ((saleReturn * WAD / precision) / WAD) * precision;
        return saleReturn;
    }

    /**
     * Calculate the total cost of tokens up to the current token
     *
     * @param _currentToken The current token number
     * @param _scalingFactor The scaling factor for the token
     * @param _initialPrice The initial price of the token
     *
     * @return totalCostOfTokens The total cost of tokens up to the current token
     */
    function _totalCostOfTokens(uint256 _currentToken, uint32 _scalingFactor, uint256 _initialPrice)
        internal
        pure
        returns (uint256)
    {
        return ((_currentToken * (_currentToken + 1) * _initialPrice) * _scalingFactor / 2) / PURE_LINEAR_SCALE;
    }

    /**
     * Calculate the current token cost
     *
     * @param _currentToken The current token number
     * @param _scalingFactor The scaling factor for the token
     * @param _initialPrice The initial price of the token
     *
     * @return currentTokenCost The current token cost
     */
    function _currentTokenCost(uint256 _currentToken, uint32 _scalingFactor, uint256 _initialPrice)
        internal
        pure
        returns (uint256 currentTokenCost)
    {
        return _initialPrice * _currentToken * _scalingFactor / PURE_LINEAR_SCALE;
    }

    /**
     * Calculate the amount of whole tokens the deposit can still cover
     *
     * @param _depositAmount The deposit amount, in reserve token
     * @param _reserveBalance The total reserve balance
     * @param _initialPrice The initial price of the token
     * @param _currentToken The current token number
     *
     * @return tokenCount The amount of whole tokens the deposit can still cover
     */
    function _calculateTokenCount(
        uint256 _depositAmount,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint256 _currentToken
    ) internal pure returns (uint256 tokenCount) {
        // Calculate the value inside the square root of the quadratic formula
        uint256 term = (2 * (_depositAmount + _reserveBalance) + WAD) / _initialPrice;
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
        tokenCount = sqrtTerm - _currentToken;
    }

    // as proposed in EIP-7054
    function _generalSqrt(uint256 x) internal pure returns (uint128) {
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
    function _optimalSqrt(uint256 y) internal pure returns (uint256 z) {
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

    function _getLength(uint256 x) internal pure returns (uint256) {
        uint256 length = 0;
        while (x > 0) {
            x /= 10;
            length++;
        }
        return length;
    }
}
