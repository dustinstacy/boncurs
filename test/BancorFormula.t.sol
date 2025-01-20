//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {BancorFormulaHarness} from "src/contracts/harnesses/BancorFormulaHarness.sol";

contract BancorFormulaTest is Test {
    BancorFormulaHarness public harness;

    uint256 constant OPT_LOG_MAX_VAL = 0x15bf0a8b1457695355fb8ac404e7a79e3;
    uint256 constant OPT_EXP_MAX_VAL = 0x800000000000000000000000000000000;
    uint256 constant FIXED_1 = 0x080000000000000000000000000000000;
    uint256 constant MAX_NUM = 0x200000000000000000000000000000000;
    uint256 constant MAX_EXP_ARRAY_VALUE = 0x1c35fedd14ffffffffffffffffffffffff;
    uint32 constant MAX_RATIO = 1000000;
    uint8 constant MIN_PRECISION = 32;
    uint8 constant MAX_PRECISION = 127;
    uint8 constant ONE = 1;
    uint256 constant WAD = 10 ** 18;

    error BancorFormula__InvalidInput();

    function setUp() public {
        harness = new BancorFormulaHarness();
    }

    function test_calculateComparisonPurchaseReturn() public view {
        uint256 supply = 10 * WAD;
        uint256 reserveBalance = 1 * WAD;
        uint32 reserveRatio = 500000;
        uint256 amount = 150 * WAD;
        uint256 purchaseReturn = harness.calculatePurchaseReturn(supply, reserveBalance, reserveRatio, amount);
        console.log("purchaseReturn: ", purchaseReturn);
    }

    function test_Revert_CalculatePurchaseReturn() public {
        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculatePurchaseReturn(0, ONE, ONE, 0);

        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculatePurchaseReturn(ONE, 0, ONE, 0);

        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculatePurchaseReturn(ONE, ONE, 0, 0);

        console.log("here");
        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculatePurchaseReturn(ONE, ONE, MAX_RATIO + 1, 0);
    }

    function test_PurchaseReturnDepositAmountZero() public view {
        uint256 supply = 1e24; // 1,000,000 Ether
        uint256 reserveBalance = 1e27; // 1,000,000,000 Ether
        uint32 reserveRatio = 500000; // 50%
        uint256 depositAmount = 0;

        uint256 result = harness.calculatePurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
        assertEq(result, 0);
    }

    function test_PurchaseReturnReserveRatioMax() public view {
        uint256 supply = 1e24; // 1,000,000 Ether
        uint256 reserveBalance = 1e27; // 1,000,000,000 Ether
        uint32 reserveRatio = MAX_RATIO; // 100%
        uint256 depositAmount = 1e21; // 1,000 Ether

        uint256 result = harness.calculatePurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
        assertEq(result, (supply * depositAmount) / reserveBalance);
    }

    function test_RevertCalculateSaleReturn() public {
        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculateSaleReturn(0, ONE, ONE, 0);

        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculateSaleReturn(ONE, 0, ONE, 0);

        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculateSaleReturn(ONE, ONE, 0, 0);

        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculateSaleReturn(ONE, ONE, MAX_RATIO + 1, 0);

        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.calculateSaleReturn(0, ONE, ONE, ONE);
    }

    function test_SaleReturnSellAmountZero() public view {
        uint256 supply = 1e24; // 1,000,000 Ether
        uint256 reserveBalance = 1e27; // 1,000,000,000 Ether
        uint32 reserveRatio = 500000; // 50%
        uint256 sellAmount = 0;

        uint256 result = harness.calculateSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
        assertEq(result, 0);
    }

    function test_SaleReturnSellAmountEqualsSupply() public view {
        uint256 supply = 1e24; // 1,000,000 Ether
        uint256 reserveBalance = 1e27; // 1,000,000,000 Ether
        uint32 reserveRatio = 500000; // 50%
        uint256 sellAmount = supply;

        uint256 result = harness.calculateSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
        assertEq(result, reserveBalance);
    }

    function test_SaleReturnReserveRatioMax() public view {
        uint256 supply = 1e24; // 1,000,000 Ether
        uint256 reserveBalance = 1e27; // 1,000,000,000 Ether
        uint32 reserveRatio = MAX_RATIO; // 100%
        uint256 sellAmount = 1e21; // 1,000 Ether

        uint256 result = harness.calculateSaleReturn(supply, reserveBalance, reserveRatio, sellAmount);
        assertEq(result, (reserveBalance * sellAmount) / supply);
    }

    function test_CalculatePurchaseReturn() public view {
        // sanity check
        uint256 reasonableSupply = 1e24; // 1,000,000 Ether
        uint256 reasonableReserveBalance = 1e27; // 1,000,000,000 Ether
        uint32 reasonableReserveRatio = 500000; // 50%
        uint256 reasonableDepositAmount = 1e21; // 1,000 Ether

        harness.calculatePurchaseReturn(
            reasonableSupply, reasonableReserveBalance, reasonableReserveRatio, reasonableDepositAmount
        );

        // Assume 1e36 (1 quadrillion Ether) as reasonable maximum
        uint256 supplyUpperBound = 1e33;
        uint256 reserveBalanceUpperBound = 1e33;
        uint32 reserveRatioUpperBound = MAX_RATIO;
        uint256 depositAmountUpperBound = 1e33;

        // test lowerBounds
        // Assume minimum input values
        harness.calculatePurchaseReturn(ONE, ONE, ONE, 0);

        // test range of bounds
        harness.calculatePurchaseReturn(supplyUpperBound, reserveBalanceUpperBound, reserveRatioUpperBound, ONE);
        harness.calculatePurchaseReturn(supplyUpperBound, reserveBalanceUpperBound, ONE, depositAmountUpperBound);
        harness.calculatePurchaseReturn(supplyUpperBound, ONE, reserveRatioUpperBound, depositAmountUpperBound);
        harness.calculatePurchaseReturn(supplyUpperBound, ONE, ONE, depositAmountUpperBound);
        harness.calculatePurchaseReturn(supplyUpperBound, ONE, reserveRatioUpperBound, ONE);
        harness.calculatePurchaseReturn(supplyUpperBound, reserveBalanceUpperBound, ONE, ONE);
        harness.calculatePurchaseReturn(ONE, reserveBalanceUpperBound, reserveRatioUpperBound, ONE);
        harness.calculatePurchaseReturn(supplyUpperBound, ONE, ONE, ONE);

        // test upperBounds
        harness.calculatePurchaseReturn(
            supplyUpperBound, reserveBalanceUpperBound, reserveRatioUpperBound, depositAmountUpperBound
        );
    }

    function test_CalculateSaleReturn() public view {
        // sanity check
        uint256 reasonableSupply = 1e24; // 1,000,000 Ether
        uint256 reasonableReserveBalance = 1e27; // 1,000,000,000 Ether
        uint32 reasonableReserveRatio = 500000; // 50%
        uint256 reasonableSaleAmount = 1e21; // 1,000 Ether

        harness.calculatePurchaseReturn(
            reasonableSupply, reasonableReserveBalance, reasonableReserveRatio, reasonableSaleAmount
        );

        // Assume 1e36 (1 quadrillion Ether) as reasonable maximum
        uint256 supplyUpperBound = 1e33;
        uint256 reserveBalanceUpperBound = 1e33;
        uint32 reserveRatioUpperBound = MAX_RATIO;
        uint256 saleAmountUpperBound = 1e33;

        // test lowerBounds
        // Assume minimum input values
        harness.calculateSaleReturn(ONE, ONE, ONE, 0);

        // test range of bounds
        harness.calculateSaleReturn(supplyUpperBound, reserveBalanceUpperBound, reserveRatioUpperBound, ONE);
        harness.calculateSaleReturn(supplyUpperBound, reserveBalanceUpperBound, ONE, saleAmountUpperBound);
        harness.calculateSaleReturn(supplyUpperBound, ONE, reserveRatioUpperBound, saleAmountUpperBound);
        harness.calculateSaleReturn(supplyUpperBound, ONE, ONE, saleAmountUpperBound);
        harness.calculateSaleReturn(supplyUpperBound, ONE, reserveRatioUpperBound, ONE);
        harness.calculateSaleReturn(supplyUpperBound, reserveBalanceUpperBound, ONE, ONE);
        harness.calculateSaleReturn(ONE, reserveBalanceUpperBound, reserveRatioUpperBound, ONE);
        harness.calculateSaleReturn(supplyUpperBound, ONE, ONE, ONE);

        // test upperBounds
        harness.calculateSaleReturn(
            supplyUpperBound, reserveBalanceUpperBound, reserveRatioUpperBound, saleAmountUpperBound
        );
    }

    // Internal view functions not fuzz tested

    function test_RevertPower() public {
        vm.expectRevert(BancorFormula__InvalidInput.selector);
        harness.power_Harness(MAX_NUM, ONE, ONE, ONE);
    }

    function test_power() public view {
        // Power function seems to be expecting reasonable inputs
        // Highly varied inputs here will lead to error in the _findPositionInMaxExpArray function
        // Makes fuzz testing this and Sale return difficult based on numerator and denominator relations
        // Fairly certain based on test results that expanindg the maxExpArray will help to handle these edge cases

        // trigger _optimalLog() & _optimalExp()
        uint256 baseN = 1e18;
        uint256 baseD = 1e18;
        uint32 expN = 500000;
        uint32 expD = 1000000;

        harness.power_Harness(baseN, baseD, expN, expD);

        // trigger _generalLog() & _optimalExp()
        baseN = 1e21;
        baseD = 1e18;
        expN = 500000;
        expD = 1000000;

        harness.power_Harness(baseN, baseD, expN, expD);

        // trigger _generalLog() & _generalExp()
        baseN = 1e21;
        baseD = 1e18;
        expN = 1000000;
        expD = 250000;

        harness.power_Harness(baseN, baseD, expN, expD);
    }

    // Internal view functions fuzz tested with appropriate bounds

    function test_findPositionInMaxExpArray(uint256 x) public view {
        uint256 lowerBound = OPT_EXP_MAX_VAL + 1;
        uint256 upperBound = MAX_EXP_ARRAY_VALUE;
        vm.assume(x > lowerBound && x < upperBound);

        uint8 result = harness.findPositionInMaxExpArray_Harness(x);
        assertGe(result, MIN_PRECISION);
        assertLe(result, MAX_PRECISION);
    }

    // Internal pure Functions fuzz tested with appropriate bounds

    function test_generalLog(uint256 x) public view {
        uint256 lowerBound = OPT_LOG_MAX_VAL;
        vm.assume(x > lowerBound);

        //overflow check
        harness.generalLog_Harness(UINT256_MAX);

        uint256 result = harness.generalLog_Harness(x);
        // generalLog(lowerBound) = 1.179e38
        uint256 minResult = 0x58b90bfbe8e7bcd5e4f1d9cc01f97b4b;
        assertGe(result, minResult);
    }

    function test_floorLog2(uint256 x) public view {
        uint256 lowerBound = FIXED_1;
        vm.assume(x > lowerBound);

        //overflow check
        harness.floorLog2_Harness(UINT256_MAX);

        uint8 result = harness.floorLog2_Harness(x);
        // Range of outcomes is 256
        uint8 minResult = 0;
        uint8 maxResult = 255;
        assertGe(result, minResult);
        assertLe(result, maxResult);
    }

    function test_generalExp(uint256 x) public view {
        uint256 lowerBound = OPT_EXP_MAX_VAL;
        uint8 lowerBoundPrecision = harness.findPositionInMaxExpArray_Harness(lowerBound);
        uint256 upperBound = MAX_EXP_ARRAY_VALUE;
        uint8 upperBoundPrecision = harness.findPositionInMaxExpArray_Harness(upperBound);
        vm.assume(x > lowerBound && x < upperBound);

        //lower bound check
        harness.generalExp_Harness((lowerBound >> (MAX_PRECISION - lowerBoundPrecision)), lowerBoundPrecision);

        //upper bound check
        harness.generalExp_Harness((upperBound >> (MAX_PRECISION - upperBoundPrecision)), upperBoundPrecision);

        //fuzz check
        uint8 precision = harness.findPositionInMaxExpArray_Harness(x);
        harness.generalExp_Harness((x >> (MAX_PRECISION - precision)), precision);
    }

    function test_optimalLog(uint256 x) public view {
        uint256 lowerBound = FIXED_1;
        uint256 upperBound = OPT_LOG_MAX_VAL - 1;
        vm.assume(x > lowerBound && x < upperBound);

        uint256 result = harness.optimalLog_Harness(x);
        // optimalLog(lowerBound) = 0
        uint256 minResult = 0;
        // optimalLog(upperBound) = 1.701e38
        uint256 maxResult = 0x7ffffffffffffffffffffffffffffffd;

        assertGe(result, minResult);
        assertLe(result, maxResult);
    }

    function test_optimalExp(uint256 x) public view {
        uint256 upperBound = OPT_EXP_MAX_VAL - 1;
        vm.assume(x < upperBound);

        uint256 result = harness.optimalExp_Harness(x);
        // optimalExp(0)
        uint256 minResult = 0x80000000000000000000000000000000;
        // optimalExp(upperBound) = 1.511e45
        uint256 maxResult = 0x43cbaf42a000812488fc5c220ad7b8fecb08ca;
        assertGe(result, minResult);
        assertLe(result, maxResult);
    }
}
