// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {LinTokenBasedFormulaHarness} from "./harnesses/LinTokenBasedFormulaHarness.sol";

contract LinTokenBasedFormulaTest is Test {
    LinTokenBasedFormulaHarness public harness;

    // Constants from the LinTokenBasedFormula.sol
    uint32 constant MAX_SCALE = 1000000; // 10000%
    uint32 constant PURE_LINEAR_SCALE = 10000; // 100%
    uint256 constant WAD = 10 ** 18;

    // Constants added for testing
    uint32 constant ONE = 1;

    error LinTokenBasedFormula__InvalidInput();

    function setUp() public {
        harness = new LinTokenBasedFormulaHarness();
    }

    function test_calculateLinTokenBasedPurchaseCost() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = PURE_LINEAR_SCALE;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost2() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = PURE_LINEAR_SCALE;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 2 * WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost3() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = PURE_LINEAR_SCALE;
        uint256 amount = 2;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 3 * WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost4() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 20000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost5() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 5000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost6() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 5000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 15e17);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost7() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 5000;
        uint256 amount = 2;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 35e17);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost8() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 5000;
        uint256 amount = 5;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 125e17);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost9() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 20000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 3 * WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost10() public view {
        uint256 supply = 27;
        uint256 initialCost = 5 * WAD;
        uint256 scalingFactor = 2000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 32 * WAD);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateLinTokenBasedPurchaseCost11() public view {
        uint256 supply = 12;
        uint256 initialCost = WAD;
        uint256 scalingFactor = 50000;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 61e18);

        supply = supply + amount;
        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, totalCost);
    }

    function test_RevertIf_InvalidCalculateLinTokenBasedPurchaseCostInput() public {
        vm.expectRevert(LinTokenBasedFormula__InvalidInput.selector);
        harness.calculateLinTokenBasedPurchaseCost(0, 0, ONE, 0);

        vm.expectRevert(LinTokenBasedFormula__InvalidInput.selector);
        harness.calculateLinTokenBasedPurchaseCost(0, ONE, 0, 0);

        vm.expectRevert(LinTokenBasedFormula__InvalidInput.selector);
        harness.calculateLinTokenBasedPurchaseCost(0, ONE, MAX_SCALE + 1, 0);
    }

    function test_calculateLinTokenBasedPurchaseCostReturnsZero() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = PURE_LINEAR_SCALE;
        uint256 amount = 0;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, 0);
    }

    function test_calculateLinTokenBasedPurchaseCostReturnsInitialCost() public view {
        uint256 supply = 0;
        uint256 initialCost = WAD;
        uint256 scalingFactor = PURE_LINEAR_SCALE;
        uint256 amount = 1;

        uint256 totalCost = harness.calculateLinTokenBasedPurchaseCost(supply, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);
    }

    function test_RevertIf_InvalidCalculateLinTokenBasedSaleReturnInput() public {
        vm.expectRevert(LinTokenBasedFormula__InvalidInput.selector);
        harness.calculateLinTokenBasedPurchaseCost(0, 0, ONE, 0);

        vm.expectRevert(LinTokenBasedFormula__InvalidInput.selector);
        harness.calculateLinTokenBasedPurchaseCost(0, ONE, 0, 0);

        vm.expectRevert(LinTokenBasedFormula__InvalidInput.selector);
        harness.calculateLinTokenBasedPurchaseCost(0, ONE, MAX_SCALE + 1, 0);

        vm.expectRevert(LinTokenBasedFormula__InvalidInput.selector);
        harness.calculateLinTokenBasedSaleReturn(0, ONE, ONE, ONE);
    }

    function test_calculateLinTokenBasedSaleReturnReturnsZero() public view {
        uint256 supply = 1;
        uint256 initialCost = WAD;
        uint256 scalingFactor = PURE_LINEAR_SCALE;
        uint256 amount = 0;

        uint256 saleReturn = harness.calculateLinTokenBasedSaleReturn(supply, initialCost, scalingFactor, amount);

        assertEq(saleReturn, 0);
    }
}
