// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BoncursFormula} from "./utils/BoncursFormula.sol";

/// @title BoncursCurve
/// @notice This contract is used to get the purchase and sale return values for a Boncurs curve.
abstract contract BoncursCurve is BoncursFormula {
    /// Returns the purchase cost using a Boncurs Curve.
    /// @param supply token total supply
    /// @param reserveBalance balance of the reserve token
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor of the curve
    /// @param amount amount of tokens to purchase
    /// @return purchaseCost cost of the conversion
    function getPurchaseCost(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 amount
    ) internal pure returns (uint256 purchaseCost) {
        purchaseCost = _calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);
    }

    /// Returns the sale value using a Boncurs Curve.
    /// @param supply token total supply
    /// @param reserveBalance balance of the reserve token
    /// @param sellAmount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function getSaleReturn(uint256 supply, uint256 reserveBalance, uint256 sellAmount)
        internal
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBoncursSaleReturn(supply, reserveBalance, sellAmount);
    }
}
