//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {BancorFormula} from "./utils/BancorFormula.sol";
import {IBoncurs} from "./IBoncurs.sol";

abstract contract Boncurs {
    BancorFormula public bancorFormula;

    function _getExponentialPurchaseReturn(
        uint256 supply,
        uint256 reserveBalance,
        uint32 reserveRatio,
        uint256 depositAmount
    ) internal view returns (uint256 purchaseReturn) {
        return bancorFormula.calculatePurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
    }

    function _getExponentialSaleReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 sellAmount)
        internal
        view
        returns (uint256 saleReturn)
    {
        return bancorFormula.calculateSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
    }
}
