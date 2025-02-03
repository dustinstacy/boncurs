// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "./BancorFormula.sol";

/// @title  ExpCurve
/// @notice This contract is used to get the purchase and sale return values for an exponential curve.
abstract contract ExpCurve is BancorFormula {
    /// Returns the purchase value using an Exponential Curve.
    /// @param supply token total supply
    /// @param reserveBalance balance of the reserve token
    /// @param reserveRatio reserve ratio of the token
    /// @param depositAmount amount of tokens to purchase
    /// @return purchaseReturn cost of the conversion
    function getPurchaseReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 depositAmount)
        internal
        view
        returns (uint256 purchaseReturn)
    {
        purchaseReturn = _calculateBancorFormulaPurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
    }

    /// Returns the sale value using an Exponential Curve.
    /// @param supply token total supply
    /// @param reserveBalance balance of the reserve token
    /// @param reserveRatio reserve ratio of the token
    /// @param sellAmount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function getSaleReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 sellAmount)
        internal
        view
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBancorFormulaSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
    }
}
