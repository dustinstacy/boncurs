// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BoncursFormula} from "./BoncursFormula.sol";

/// @title BoncursCurve
/// @author Dustin Stacy
/// @notice Used to get the purchase and sale return values for a Boncurs curve.
abstract contract BoncursCurve is BoncursFormula {
    /// Get the purchase cost using a Boncurs Curve.
    /// @param supply token total supply
    /// @param reserveBalance reserve balance of the token
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor of the curve
    /// @param amount amount of tokens to purchase
    ///
    /// @return costToMint cost of the conversion
    function getPurchaseCost(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 costToMint) {
        costToMint = _calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);
    }

    /// Get the sale return using a Boncurs Curve.
    /// @param supply token total supply
    /// @param reserveBalance reserve balance of the token
    /// @param sellAmount amount of tokens to sell
    ///
    /// @return saleReturn return of the conversion
    function getSaleReturn(uint256 supply, uint256 reserveBalance, uint256 sellAmount)
        internal
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBoncursSaleReturn(supply, reserveBalance, sellAmount);
    }
}
