//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "./utils/BancorFormula.sol";

abstract contract Boncurs is BancorFormula {
    function _getBancorFormulaPurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint32 reserveRatio,
        uint256 depositAmount
    ) internal view returns (uint256 purchaseReturn) {
        return _calculateBancorFormulaPurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
    }

    function _getBancorFormulaSaleReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint32 reserveRatio,
        uint256 sellAmount
    ) internal view returns (uint256 saleReturn) {
        return _calculateBancorFormulaSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
    }
}
