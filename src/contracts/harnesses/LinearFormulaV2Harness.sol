//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {LinearFormulaV2} from "../utils/LinearFormulaV2.sol";

contract LinearFormulaV2Harness is LinearFormulaV2 {
    function calculatePurchaseReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialPrice,
        uint32 _scalingFactor,
        uint256 _depositAmount
    ) external pure returns (uint256 purchaseReturn) {
        purchaseReturn =
            _calculateLinearV2PurchaseReturn(_supply, _reserveBalance, _initialPrice, _scalingFactor, _depositAmount);
    }

    function calculateSaleReturn(
        uint256 _supply,
        uint256 _reserveBalance,
        uint256 _initialReserve,
        uint32 _scalingFactor,
        uint256 _sellAmount
    ) external pure returns (uint256 saleReturn) {
        saleReturn =
            _calculateLinearV2SaleReturn(_supply, _reserveBalance, _initialReserve, _scalingFactor, _sellAmount);
    }
}
