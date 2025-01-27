//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {LinFormulaHarness} from "src/contracts/harnesses/LinFormulaHarness.sol";

contract LinFormulaTest is Test {
    LinFormulaHarness public harness;
    uint256 public constant WAD = 10 ** 18;

    function setUp() public {
        harness = new LinFormulaHarness();
    }

    function test_disc1_V2() public view {
        // gas: 10266
        // current token: 1
        // purchaseReturn: 1000000000000000000 (1)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc2_V2() public view {
        // gas: 10558
        // current token: 985
        // purchaseReturn: 907614213197969543 (.907614213197969543)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc3_V2() public view {
        // gas: 15301
        // current token: 18
        // purchaseReturn: 15222222222222222222 (15.222222222222222222)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc4_V2() public view {
        // gas: 14766
        // current token: 399
        // purchaseReturn: 396588972431077694235 (396.588972431077694235)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc5_V2() public view {
        // gas: 14792
        // current token: 44230
        // purchaseReturn: 44227923016052453086140 (44227.92301605245308614)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc6_V2() public view {
        // gas: 15346
        // current token: 44230
        // purchaseReturn: 44227923016052453086140 (44227.92301605245308614)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc7_V2() public view {
        // gas: 16096
        // current token: 2
        // purchaseReturn: 1500000000000000000 (1.5)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc8_V2() public view {
        // gas: 13134
        // current token: 2
        // purchaseReturn: 1891207568169170840 (1.89120756816917084)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }

    function test_disc9_V2() public view {
        // gas: 10224
        // current token: 490
        // purchaseReturn: 5678398237425187 (.005678398237425187)
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

        assertApproxEqAbs(saleReturn, depositAmount, 1e3);
    }
}
