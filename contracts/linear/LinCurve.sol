//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinFormula} from "./LinFormula.sol";

/**
 * @title  LinCurve
 * @author Dustin Stacy
 * @notice Used to get the purchase and sale return values for a linear curve
 */
contract LinCurve is LinFormula {
    /**
     *     @param supply token total supply
     *     @param reserveBalance reserve balance of the token
     *     @param initialCost initial cost of the token
     *     @param scalingFactor scaling factor for the token
     *     @param depositAmount amount of tokens to purchase
     *
     *     @return purchaseReturn cost of the conversion
     */
    function getPurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint256 initialCost,
        uint32 scalingFactor,
        uint256 depositAmount
    ) internal pure returns (uint256 purchaseReturn) {
        purchaseReturn = _calculateLinPurchaseReturn(supply, reserveBalance, initialCost, scalingFactor, depositAmount);
    }

    /**
     *     @param supply token total supply
     *     @param reserveBalance reserve balance of the token
     *     @param initialCost initial cost of the token
     *     @param scalingFactor scaling factor for the token
     *     @param sellAmount amount of tokens to sell
     *
     *     @return saleReturn return of the conversion
     */
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
