//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {BoncursFormulaHarness} from "./harnesses/BoncursFormulaHarness.sol";

contract BoncursFormulaTest is Test {
    BoncursFormulaHarness public harness;

    // Constants from the BoncursFormula.sol
    uint32 constant MIN_SCALE = 10000; // 100%
    uint32 constant MAX_SCALE = 1000000; // 10000%
    uint256 constant WAD = 10 ** 18;

    // Constants added for testing
    uint32 constant ONE = 1;

    error BoncursFormula__InvalidInput();

    function setUp() public {
        harness = new BoncursFormulaHarness();
    }

    function test_calculateBoncursPurchaseCost() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialCost = WAD;
        uint32 scalingFactor = MIN_SCALE;
        uint256 amount = 1;

        uint256 totalCost =
            harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply += amount;
        reserveBalance += totalCost;
        uint256 saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertEq(saleReturn, totalCost);
    }

    function test_calculateBoncursPurchaseCost2() public view {
        uint256 supply = 1;
        uint256 reserveBalance = WAD;
        uint256 initialCost = WAD;
        uint32 scalingFactor = 20000;
        uint256 amount = 1;

        uint256 totalCost =
            harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, 2 * WAD);

        supply += amount;
        reserveBalance += totalCost;
        uint256 saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertEq(saleReturn, 15e17);
    }

    function test_calculateBoncursPurchaseCost3() public view {
        uint256 supply = 2;
        uint256 reserveBalance = 3 * WAD;
        uint256 initialCost = WAD;
        uint32 scalingFactor = 20000;
        uint256 amount = 1;

        uint256 totalCost =
            harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, 3 * WAD);

        supply += amount;
        reserveBalance += totalCost;
        uint256 saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertEq(saleReturn, 2 * WAD);
    }

    function test_calculateBoncursPurchaseCost4() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialCost = WAD;
        uint32 scalingFactor = 20000;
        uint256 amount = 2;

        uint256 totalCost =
            harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, 3 * WAD);

        supply += amount;
        reserveBalance += totalCost;
        uint256 saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertEq(saleReturn, 15e17);
    }

    function test_calculateBoncursPurchaseCost5() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialCost = WAD;
        uint32 scalingFactor = 15000;
        uint256 amount = 1;

        uint256 totalCost =
            harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);

        supply += amount;
        reserveBalance += totalCost;

        totalCost = harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, 15e17);

        supply += amount;
        reserveBalance += totalCost;

        totalCost = harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, 1875e15);

        supply += amount;
        reserveBalance += totalCost;

        totalCost = harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertApproxEqAbs(totalCost, 21875e14, 1e3);

        supply += amount;
        reserveBalance += totalCost;

        totalCost = harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertApproxEqAbs(totalCost, 24609375e11, 1e3);

        supply += amount;
        reserveBalance += totalCost;

        uint256 saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertApproxEqAbs(saleReturn, 18046875e11, 1e3);

        supply -= amount;
        reserveBalance -= saleReturn;

        saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertApproxEqAbs(saleReturn, 18046875e11, 1e3);

        supply -= amount;
        reserveBalance -= saleReturn;

        saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertApproxEqAbs(saleReturn, 18046875e11, 1e3);

        supply -= amount;
        reserveBalance -= saleReturn;

        saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertApproxEqAbs(saleReturn, 18046875e11, 1e3);

        supply -= amount;
        reserveBalance -= saleReturn;

        saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, WAD);

        assertApproxEqAbs(saleReturn, 18046875e11, 1e3);

        supply -= amount;
        reserveBalance -= saleReturn;

        assertEq(supply, 0);
        assertEq(reserveBalance, 0);
    }

    function test_RevertIf_InvalidCalculateBoncursPurchaseCostInput() public {
        vm.expectRevert(BoncursFormula__InvalidInput.selector);
        harness.calculateBoncursPurchaseCost(0, 0, 0, MIN_SCALE, 0);

        vm.expectRevert(BoncursFormula__InvalidInput.selector);
        harness.calculateBoncursPurchaseCost(0, 0, ONE, MIN_SCALE - 1, 0);

        vm.expectRevert(BoncursFormula__InvalidInput.selector);
        harness.calculateBoncursPurchaseCost(0, 0, ONE, MAX_SCALE + 1, 0);
    }

    function test_calculateBoncursPurchaseCostReturnsZero() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialCost = WAD;
        uint32 scalingFactor = MIN_SCALE;
        uint256 amount = 0;

        uint256 totalCost =
            harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, 0);
    }

    function test_calculateBoncursPurchaseCostReturnsInitialCost() public view {
        uint256 supply = 0;
        uint256 reserveBalance = 0;
        uint256 initialCost = WAD;
        uint32 scalingFactor = MIN_SCALE;
        uint256 amount = 1;

        uint256 totalCost =
            harness.calculateBoncursPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);

        assertEq(totalCost, WAD);
    }

    function test_calculateBoncursSaleReturnReturnsZero() public view {
        uint256 supply = 0;
        uint256 reserveBalance = WAD;
        uint256 amount = 1;

        uint256 saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, amount);

        assertEq(saleReturn, 0);

        supply = 1;
        reserveBalance = 0;

        saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, amount);

        assertEq(saleReturn, 0);

        reserveBalance = WAD;
        amount = 0;

        saleReturn = harness.calculateBoncursSaleReturn(supply, reserveBalance, amount);

        assertEq(saleReturn, 0);
    }
}
