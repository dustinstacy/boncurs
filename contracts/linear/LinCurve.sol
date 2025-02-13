// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinFormula} from "./utils/LinFormula.sol";

/// @title  LinCurve
/// @notice This contract is used to get the purchase and sale return values for a linear curve.
abstract contract LinCurve is LinFormula {
    /// Returns the purchase value using a Linear Curve.
    /// @param supply token total supply
    /// @param reserveBalance current balance of the reserve token
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in ppm, 1-1000000  token
    /// @param depositAmount amount of tokens to purchase
    /// @return purchaseReturn return of the conversion
    function getPurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        purchaseReturn = _calculateLinPurchaseReturn(supply, reserveBalance, initialCost, scalingFactor, depositAmount);
    }

    /// Returns the sale value using a Linear Curve.
    /// @param supply token total supply
    /// @param reserveBalance balance of the reserve token
    /// @param initialCost initial cost of the token
    /// @param scalingFactor scaling factor, represented in ppm, 1-1000000  token
    /// @param sellAmount amount of tokens to sell
    /// @return saleReturn return of the conversion
    function getSaleReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 sellAmount
    ) internal pure returns (uint256 saleReturn) {
        saleReturn = _calculateLinSaleReturn(supply, reserveBalance, initialCost, scalingFactor, sellAmount);
    }
}
