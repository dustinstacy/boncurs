//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {ExpTokenBasedFormulaHarness} from "src/contracts/harnesses/ExpTokenBasedFormulaHarness.sol";

contract ExpTokenBasedFormulaTest is Test {
    ExpTokenBasedFormulaHarness public harness;

    // Constants from the ExpTokenBasedFormula.sol
    uint32 private constant MAX_SCALE = 1000000; // 10000%
    uint256 private constant WAD = 10 ** 18;

    // Constants added for testing
    uint32 constant ONE = 1;
    uint32 constant HALF_SCALE = 5000; // 50%

    error ExpTokenBasedFormula__InvalidInput();

    function setUp() public {
        harness = new ExpTokenBasedFormulaHarness();
    }

    function test_calculateExpTokenBasedPurchaseCost() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost2() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 10002e14);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost3() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 2;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 20002e14);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost4() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 20000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost5() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost6() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 50000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 100002e13);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost7() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 50000;
        uint256 amount = 2;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 20001e14);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost8() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 5;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 5011e15);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost9() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 20000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 100005e13);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost10() public view {
        uint256 supply = 27;
        uint256 initialCost = 5 * WAD;
        uint256 scalingFactor = 2000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 68225e14);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateExpTokenBasedPurchaseCost11() public view {
        uint256 supply = 12;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 50000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 100288e13);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_RevertIf_InvalidCalculateExpTokenBasedPurchaseCostInput() public {
        vm.expectRevert(ExpTokenBasedFormula__InvalidInput.selector);
        harness.calculateExpTokenBasedPurchaseCost(0, 0, ONE, 0);

        vm.expectRevert(ExpTokenBasedFormula__InvalidInput.selector);
        harness.calculateExpTokenBasedPurchaseCost(0, ONE, 0, 0);

        vm.expectRevert(ExpTokenBasedFormula__InvalidInput.selector);
        harness.calculateExpTokenBasedPurchaseCost(0, ONE, MAX_SCALE + 1, 0);
    }

    function test_calculateExpTokenBasedPurchaseCostReturnsZero() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 0;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 0);
    }

    function test_calculateExpTokenBasedPurchaseCostReturnsInitialCost() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateExpTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);
    }

    function test_RevertIf_InvalidCalculateExpTokenBasedSaleReturnInput() public {
        vm.expectRevert(ExpTokenBasedFormula__InvalidInput.selector);
        harness.calculateExpTokenBasedPurchaseCost(0, 0, ONE, 0);

        vm.expectRevert(ExpTokenBasedFormula__InvalidInput.selector);
        harness.calculateExpTokenBasedPurchaseCost(0, ONE, 0, 0);

        vm.expectRevert(ExpTokenBasedFormula__InvalidInput.selector);
        harness.calculateExpTokenBasedPurchaseCost(0, ONE, MAX_SCALE + 1, 0);

        vm.expectRevert(ExpTokenBasedFormula__InvalidInput.selector);
        harness.calculateExpTokenBasedSaleReturn(0, ONE, ONE, ONE);
    }

    function test_calculateExpTokenBasedSaleReturnReturnsZero() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = HALF_SCALE;
        uint256 amount = 0;

        uint256 saleReturn = harness.calculateExpTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, 0);
    }
}
