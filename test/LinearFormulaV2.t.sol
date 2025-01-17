//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {LinearFormulaV2Harness} from "src/contracts/harnesses/LinearFormulaV2Harness.sol";

contract LinearFormulaV2Test is Test {
    LinearFormulaV2Harness public harness;
    uint256 public constant WAD = 10 ** 18;

    function setUp() public {
        harness = new LinearFormulaV2Harness();
    }

    function test_calculateLinearPurchaseReturnV2() public view {
        // Gas 10287
        // Purchase Return 1000000000000000000 (1)
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD;

        uint256 purchaseReturn =
            harness.calculateLinearPurchasev2(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Gas 10578
        // Purchase Return 907614213197969543 (.907614213197969543)
        supply = WAD * 984;
        reserveBalance = WAD * 451;
        initialPrice = WAD;
        scalingFactor = 1000000;
        depositAmount = WAD * 894;

        purchaseReturn =
            harness.calculateLinearPurchasev2(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Gas 15041
        // Purchase Return 15222222222222222222 (15.222222222222222222)
        supply = WAD * 2;
        reserveBalance = WAD * 3;
        initialPrice = WAD;
        scalingFactor = 1000000;
        depositAmount = WAD * 154;

        purchaseReturn =
            harness.calculateLinearPurchasev2(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Gas 14272!!!
        // Purchase Return 422829787234042553191 (422.829787234042553191)
        // discrepancy?
        depositAmount = WAD * 89604;

        purchaseReturn =
            harness.calculateLinearPurchasev2(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        console.log("purchaseReturnV2 2: ", purchaseReturn);
    }
}
