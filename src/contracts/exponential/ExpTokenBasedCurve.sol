//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ExpTokenBasedFormula} from "./ExpTokenBasedFormula.sol";

/**
 * @title ExpTokenBasedCurve
 * @author Dustin Stacy
 * @notice Used to get the purchase and sale return values for an exponential token-based curve
 */
contract ExpTokenBasedCurve is ExpTokenBasedFormula {
    /**
     * @param supply token total supply
     * @param initialCost initial cost of the token
     * @param scalingFactor scaling factor for the token
     * @param amount amount of tokens to purchase
     *
     * @return costToMint cost of the conversion
     */
    function getPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
        internal
        pure
        returns (uint256 costToMint)
    {
        costToMint = _calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);
    }

    /**
     * @param supply token total supply
     * @param initialCost initial cost of the token
     * @param scalingFactor scaling factor for the token
     * @param sellAmount amount of tokens to sell
     *
     * @return saleReturn return of the conversion
     */
    function getSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 sellAmount)
        internal
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, sellAmount);
    }
}
