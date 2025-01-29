//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {LinFormulaHarness} from "./harnesses/LinFormulaHarness.sol";

/// @notice Test to ensure that the Linear Formula calculations are correct
contract LinFormulaTest is Test {
    LinFormulaHarness public harness;

    // Constants from the LinFormula.sol
    uint32 constant MAX_SCALE = 100000000; // 10000%
    uint32 constant PURE_LINEAR_SCALE = 1000000; // 100%
    uint256 constant WAD = 10 ** 18;
    uint256 constant OPTIMAL_TERM_MAX_VAL = 0x6a;

    // Constants added for testing
    uint32 constant ONE = 1;

    error LinFormula__InvalidInput();

    function setUp() public {
        harness = new LinFormulaHarness();
    }

    function test_LinFormulaCalculations() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        // Check the return nevers exceeds the deposit amount in the math reversal
        assertLe(saleReturn, depositAmount);
        // Check the return is approximately equal withing the precision decimal places
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        // Check the return is approximately equal within 99.999999999999900%
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations2() public view {
        uint256 supply = WAD * 984;
        uint256 reserveBalance = WAD * 484620;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD * 894;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations3() public view {
        uint256 supply = WAD * 2;
        uint256 reserveBalance = WAD * 3;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD * 154;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations4() public view {
        uint256 supply = WAD * 2;
        uint256 reserveBalance = WAD * 3;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD * 79633;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations5() public view {
        uint256 supply = WAD * 2;
        uint256 reserveBalance = WAD * 3;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD * 978165157;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations6() public view {
        uint256 supply = WAD * 415;
        uint256 reserveBalance = WAD * 129480;
        uint256 initialPrice = 15e17;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = WAD * 3818;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations7() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint256 depositAmount = WAD;
        uint32 scalingFactor = 500000;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        // Price of the current token is 1/2 WAD and the next token is 1 WAD
        assertEq(purchaseReturn, 1.5e18);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations8() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint256 depositAmount = WAD;
        uint32 scalingFactor = 359400;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations9() public view {
        uint256 supply = 48911e16;
        uint256 reserveBalance = 4307728866e13;
        uint256 initialPrice = WAD;
        uint256 depositAmount = WAD;
        uint32 scalingFactor = 359400;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_LinFormulaCalculations10() public view {
        uint256 supply = 100e18;
        uint256 reserveBalance = 505e15;
        uint256 initialPrice = 1e16;
        uint256 depositAmount = WAD;
        uint32 scalingFactor = 10000;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        supply += purchaseReturn;
        reserveBalance += depositAmount;
        uint256 sellAmount = purchaseReturn;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        uint256 precision = 100;
        if (saleReturn > WAD) {
            uint256 length = harness.getLength(saleReturn / WAD);
            precision = 10 ** length;
        }

        assertLe(saleReturn, depositAmount);
        assertApproxEqAbs(saleReturn, depositAmount, precision);
        assertApproxEqRel(saleReturn, depositAmount, 100);
    }

    function test_RevertIf_InvalidCalculateLinPurchaseReturnInput() public {
        vm.expectRevert(LinFormula__InvalidInput.selector);
        harness.calculatePurchaseReturn(0, 0, 0, ONE, 0);

        vm.expectRevert(LinFormula__InvalidInput.selector);
        harness.calculatePurchaseReturn(0, 0, ONE, 0, 0);

        vm.expectRevert(LinFormula__InvalidInput.selector);
        harness.calculatePurchaseReturn(0, 0, ONE, MAX_SCALE + 1, 0);
    }

    function test_LinPurchaseReturnDepositAmountZero() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 depositAmount = 0;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn(supply, reserveBalance, initialPrice, scalingFactor, depositAmount);

        assertEq(purchaseReturn, 0);
    }

    function test_RevertIf_InvalidCalculateLinSaleReturnInput() public {
        vm.expectRevert(LinFormula__InvalidInput.selector);
        harness.calculateSaleReturn(0, 0, 0, ONE, 0);

        vm.expectRevert(LinFormula__InvalidInput.selector);
        harness.calculateSaleReturn(0, 0, ONE, 0, 0);

        vm.expectRevert(LinFormula__InvalidInput.selector);
        harness.calculateSaleReturn(0, 0, ONE, MAX_SCALE + 1, 0);

        vm.expectRevert(LinFormula__InvalidInput.selector);
        harness.calculateSaleReturn(0, 0, ONE, 0, ONE);
    }

    function test_LinSaleReturnDepositAmountZero() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 sellAmount = 0;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        assertEq(saleReturn, 0);
    }

    function test_LinSaleReturnSellAmountEqualsSupply() public view {
        uint256 supply = 100;
        uint256 reserveBalance = 100;
        uint256 initialPrice = WAD;
        uint32 scalingFactor = 1000000;
        uint256 sellAmount = supply;

        uint256 saleReturn =
            harness.calculateSaleReturn(supply, reserveBalance, initialPrice, scalingFactor, sellAmount);

        assertEq(saleReturn, reserveBalance);
    }

    function test_currentTokenCost() public view {
        uint256 currentToken = 1;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = WAD;

        uint256 currentTokenCost = harness.currentTokenCost(currentToken, scalingFactor, initialPrice);

        assertEq(currentTokenCost, WAD);
    }

    function test_currentTokenCost2() public view {
        uint256 currentToken = 100;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = WAD;

        uint256 currentTokenCost = harness.currentTokenCost(currentToken, scalingFactor, initialPrice);

        assertEq(currentTokenCost, 100e18);
    }

    function test_currentTokenCost3() public view {
        uint256 currentToken = 100;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = 15e17;

        uint256 currentTokenCost = harness.currentTokenCost(currentToken, scalingFactor, initialPrice);

        assertEq(currentTokenCost, 15e19);
    }

    function test_currentTokenCost4() public view {
        uint256 currentToken = 42;
        uint32 scalingFactor = 500000;
        uint256 initialPrice = WAD;

        uint256 currentTokenCost = harness.currentTokenCost(currentToken, scalingFactor, initialPrice);

        assertEq(currentTokenCost, 21e18);
    }

    function test_totalCostOfTokens() public view {
        uint256 currentToken = 1;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = WAD;

        uint256 totalCost = harness.totalCostOfTokens(currentToken, scalingFactor, initialPrice);

        assertEq(totalCost, WAD);
    }

    function test_totalCostOfTokens2() public view {
        uint256 currentToken = 100;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = WAD;

        uint256 totalCost = harness.totalCostOfTokens(currentToken, scalingFactor, initialPrice);

        assertEq(totalCost, 505e19);
    }

    function test_totalCostOfTokens3() public view {
        uint256 currentToken = 100;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = 15e17;

        uint256 totalCost = harness.totalCostOfTokens(currentToken, scalingFactor, initialPrice);

        assertEq(totalCost, 7575e18);
    }

    function test_totalCostOfTokens4() public view {
        uint256 currentToken = 42;
        uint32 scalingFactor = 500000;
        uint256 initialPrice = WAD;

        uint256 totalCost = harness.totalCostOfTokens(currentToken, scalingFactor, initialPrice);

        assertEq(totalCost, 4515e17);
    }

    function test_calculateTokenCount() public view {
        uint256 deposit = WAD;
        uint256 reserveBalance = 1e18;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = WAD;
        uint256 currentToken = 1;

        uint256 tokenCount =
            harness.calculateTokenCount(deposit, reserveBalance, initialPrice, scalingFactor, currentToken);

        assertEq(tokenCount, 1);
    }

    function test_calculateTokenCount2() public view {
        uint256 deposit = WAD * 3;
        uint256 reserveBalance = 1e18;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = WAD;
        uint256 currentToken = 1;

        uint256 tokenCount =
            harness.calculateTokenCount(deposit, reserveBalance, initialPrice, scalingFactor, currentToken);

        assertEq(tokenCount, 1);
    }

    function test_calculateTokenCount3() public view {
        uint256 deposit = 500e18;
        uint256 reserveBalance = 1e18;
        uint32 scalingFactor = 1000000;
        uint256 initialPrice = WAD;
        uint256 currentToken = 1;

        uint256 tokenCount =
            harness.calculateTokenCount(deposit, reserveBalance, initialPrice, scalingFactor, currentToken);

        assertEq(tokenCount, 30);
    }

    function test_optimalSqrt() public view {
        uint256 x = 100;
        uint256 result = harness.optimalSqrt(x);

        assertEq(result, 10);
    }

    function test_optimalSqrt2() public view {
        uint256 x = 99;
        uint256 result = harness.optimalSqrt(x);

        assertEq(result, 9);
    }

    function test_optimalSqrt3() public view {
        uint256 x = 3;
        uint256 result = harness.optimalSqrt(x);

        assertEq(result, 2);
    }

    function test_optimalSqrt4() public view {
        uint256 x = 1;
        uint256 result = harness.optimalSqrt(x);

        assertEq(result, 2);
    }

    function test_generalSqrt() public view {
        uint256 x = 1000000000000000000;
        uint256 result = harness.generalSqrt(x);

        assertEq(result, 1000000000);
    }

    function test_generalSqrt2() public view {
        uint256 x = 3481;
        uint256 result = harness.generalSqrt(x);

        assertEq(result, 59);
    }

    function test_generalSqrt3() public view {
        uint256 x = 9025;
        uint256 result = harness.generalSqrt(x);

        assertEq(result, 95);
    }

    function test_generalSqrt4() public view {
        uint256 x = 678007321744;
        uint256 result = harness.generalSqrt(x);

        assertEq(result, 823412);
    }

    function test_getLength() public view {
        uint256 x = 1;
        uint256 length = harness.getLength(x);

        assertEq(length, 1);
    }

    function test_getLength2() public view {
        uint256 x = 48;
        uint256 length = harness.getLength(x);

        assertEq(length, 2);
    }

    function test_getLength3() public view {
        uint256 x = 321987;
        uint256 length = harness.getLength(x);

        assertEq(length, 6);
    }

    function test_getLength4() public view {
        uint256 x = 1000000000000000000;
        uint256 length = harness.getLength(x);

        assertEq(length, 19);
    }
}
