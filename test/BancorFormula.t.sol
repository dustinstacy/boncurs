//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {BancorFormulaHarness} from "src/contracts/harnesses/BancorFormulaHarness.sol";

contract BancorFormulaTest is Test {
    BancorFormulaHarness public harness;

    function setUp() public {
        harness = new BancorFormulaHarness();
    }

    function test_CalculatePurchaseReturn() public {
        uint256 supply = 1000;
        uint256 reserveBalance = 1000;
        uint32 reserveRatio = 500000;
        uint256 depositAmount = 100;

        uint256 purchaseReturn =
            harness.calculatePurchaseReturn_Copy(supply, reserveBalance, reserveRatio, depositAmount);
    }

    function test_CalculateSaleReturn() public {
        uint256 supply = 1000;
        uint256 reserveBalance = 1000;
        uint32 reserveRatio = 500000;
        uint256 sellAmount = 100;

        uint256 saleReturn = harness.calculateSaleReturn_Copy(supply, reserveBalance, reserveRatio, sellAmount);
    }

    function test_power() public {
        uint256 baseN = 1000;
        uint256 baseD = 1000;
        uint32 expN = 500000;
        uint32 expD = 1000000;

        (uint256 result, uint256 precision) = harness.power_Harness(baseN, baseD, expN, expD);
    }

    function test_generalLog() public {
        uint256 x = 1000;

        uint256 result = harness.generalLog_Harness(x);
    }

    function test_floorLog2() public {
        uint256 x = 1000;

        uint256 result = harness.floorLog2_Harness(x);
    }

    function test_findPositionInMaxExpArray() public {
        uint256 x = 1000;

        uint8 result = harness.findPositionInMaxExpArray_Harness(x);
    }

    function test_generalExp() public {
        uint256 x = 1000;
        uint8 precision = 100;

        uint256 result = harness.generalExp_Harness(x, precision);
    }

    function test_optimalLog() public {
        uint256 x = uint256(1.01e18 * 0x080000000000000000000000000000000) / 1e18;

        uint256 result = harness.optimalLog_Harness(x);
    }

    function test_optimalExp() public {
        uint256 x = 1000;

        uint256 result = harness.optimalExp_Harness(x);
    }
}
