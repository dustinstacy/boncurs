//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "./BancorFormula.sol";

contract ExpCurve is BancorFormula {
    function getPurchaseReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 depositAmount)
        internal
        view
        returns (uint256 purchaseReturn)
    {
        purchaseReturn = _calculateBancorFormulaPurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
    }

    function getSaleReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 sellAmount)
        internal
        view
        returns (uint256 saleReturn)
    {
        saleReturn = _calculateBancorFormulaSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
    }
}
