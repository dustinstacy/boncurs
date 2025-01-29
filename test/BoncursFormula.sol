//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {BoncursFormulaHarness} from "./harnesses/BoncursFormulaHarness.sol";

contract BoncursFormulaTest is Test {
    BoncursFormulaHarness public harness;

    // Constants from the BoncursFormula.sol
    uint32 constant MIN_SCALE = 10000; // 100%
    uint256 constant MAX_SCALE = 1000000; // 10000%
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
}
