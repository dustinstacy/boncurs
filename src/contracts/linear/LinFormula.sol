//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * @title  LinFormula
 * @author Dustin Stacy
 * @notice Provides functions for calculating the purchase and sale return values on a linear curve using a scaling factor
 *         This formula converts a given reserve token amount to a token amount and vice versa
 */
abstract contract LinFormula {
    // Max scaling factor in parts per million
    uint32 private constant MAX_SCALE = 100000000; // 10000%
    // 1:1 scaling factor in parts per million
    uint32 private constant PURE_LINEAR_SCALE = 1000000; // 100%
    // Decimal precision (1 Ether)
    uint256 private constant WAD = 10 ** 18;
    /// @dev Value that represents the point at which the optimal function approximations are still effective
    uint256 private constant OPTIMAL_TERM_MAX_VAL = 0x6a;

    // Custom errors
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
     *     @param supply            token total supply
     *     @param reserveBalance    total reserve balance
     *     @param initialCost      initial price of the token
     *     @param scalingFactor     scaling factor for the token
     *     @param depositAmount     deposit amount, in reserve token
     *
     *     @return purchaseReturn return amount
     */
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

        // Determine the current token number, cost, and balance
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

    /**
     * @dev given a token supply, reserve balance, initial price, scaling factor and a sell amount (in the main token),
     *     calculates the return for a given conversion (in the reserve token)
     *
     *     If the sell amount is less than the current token fragment, the return is calculated based on the current token cost.
     *     If the sell amount is greater than the current token fragment, the variables are calibrated to move to the previous token.
     *     Then the amount of whole tokens left in the sale is converted to the reserve token and added to the return.
     *     If there is a remainder, the final addition to the return is calculated based on the new current token cost.
     *
     *     @param supply            token total supply
     *     @param reserveBalance    total reserve
     *     @param initialCost      initial price of the token
     *     @param scalingFactor     scaling factor for the token
     *     @param sellAmount        sell amount, in the token itself
     *
     *
     *    @return saleReturn return amount
     */
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
        uint256 currentTokenBalance = _totalCostOfTokens(currentToken, scalingFactor, initialCost) - reserveBalance;
        uint256 currentFragment = WAD - (currentTokenBalance * WAD / currentTokenCost);

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

    /**
     * Calculate the total cost of tokens up to the current token
     *
     * @param currentToken The current token number
     * @param scalingFactor The scaling factor for the token
     * @param initialCost The initial price of the token
     *
     * @return totalCostOfTokens The total cost of tokens up to the current token
     */
    function _totalCostOfTokens(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
        internal
        pure
        returns (uint256)
    {
        return ((currentToken * (currentToken + 1) * initialCost) * scalingFactor / 2) / PURE_LINEAR_SCALE;
    }

    /**
     * Calculate the current token cost
     *
     * @param currentToken The current token number
     * @param scalingFactor The scaling factor for the token
     * @param initialCost The initial price of the token
     *
     * @return currentTokenCost The current token cost
     */
    function _currentTokenCost(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
        internal
        pure
        returns (uint256 currentTokenCost)
    {
        return initialCost * currentToken * scalingFactor / PURE_LINEAR_SCALE;
    }

    /**
     * Calculate the amount of whole tokens the deposit can still cover
     *
     * @param depositAmount The deposit amount, in reserve token
     * @param reserveBalance The total reserve balance
     * @param initialCost The initial price of the token
     * @param currentToken The current token number
     *
     * @return tokenCount The amount of whole tokens the deposit can still cover
     */
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
        // term = term * scalingFactor / PURE_LINEAR_SCALE;
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
