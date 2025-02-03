// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinTokenBasedFormula} from "./LinTokenBasedFormula.sol";

/// @title LinTokenBasedCurve
/// @notice This contract is used to get the purchase and sale return values for a linear token based curve.
abstract contract LinTokenBasedCurve is LinTokenBasedFormula {
    /// Returns the purchase cost using a Linear Token Based Curve.
    /// @param supply token total supply
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor for the token
    /// @param amount amount of tokens to purchase
    /// @return purchaseCost cost of the conversion
    function getPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
        internal
        pure
        returns (uint256 purchaseCost)
    {
        purchaseCost = _calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);
    }

    /// Returns the sale value using a Linear Token Based Curve.
    /// @param supply token total supply
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor for the token
    /// @param sellAmount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function getSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 sellAmount)
        internal
        pure
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, sellAmount);
    }
}
