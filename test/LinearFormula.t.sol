//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {LinearFormulaHarness} from "src/contracts/harnesses/LinearFormulaHarness.sol";

contract LinearFormulaTest is Test {
    LinearFormulaHarness public harness;
    uint256 public constant WAD = 10 ** 18;

    function setUp() public {
        harness = new LinearFormulaHarness();
    }

    function test_CalculateLinearPurchaseReturn() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);
        assertEq(purchaseReturn, WAD);

        supply += purchaseReturn;
        reserveBalance += depositAmount;

        purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Price of the current token is 2 * WAD
        assertEq(purchaseReturn, WAD / 2);

        supply += purchaseReturn;
        reserveBalance += depositAmount;

        purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Remaining half of the current token
        assertEq(purchaseReturn, WAD / 2);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        depositAmount = WAD * 7;

        purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Prices of current token (3 * WAD) and next token (4 * WAD) / depositAmount (7 * WAD)
        assertEq(purchaseReturn, WAD * 2);
    }

    function test_calculateLinearPurchaseReturnScalingFactor() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint256 depositAmount = WAD;
        uint32 scalingFactor = 500000;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Price of the current token is 1/2 WAD and the next token is 1 WAD
        assertEq(purchaseReturn, 1.5e18);
    }

    function test_GasComparison() public view {
        // Gas 10265
        // Purchase Return 1000000000000000000 (1)
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Gas 10600
        // Purchase Return 907614213197969543 (.907614213197969543)
        supply = WAD * 984;
        reserveBalance = WAD * 451;
        initialPrice = WAD;
        scalingFactor = 1000000;
        depositAmount = WAD * 894;

        purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Gas 55209
        // Purchase Return 15222222222222222222 (15.222222222222222222)
        supply = WAD * 2;
        reserveBalance = WAD * 3;
        initialPrice = WAD;
        scalingFactor = 1000000;
        depositAmount = WAD * 154;

        purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Gas 1532203!!!
        // Purchase Return 420836879432624113475 (420.836879432624113475)
        depositAmount = WAD * 89604;

        purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);
    }
}
