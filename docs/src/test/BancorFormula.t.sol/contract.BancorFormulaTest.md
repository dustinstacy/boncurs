# BancorFormulaTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/415e7d62135e63eb569b341e480848bbb293bfa1/test/BancorFormula.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)

Tests to ensure all functions in BancorFormula are working as expected after updates


## State Variables
### harness

```solidity
BancorFormulaHarness public harness;
```


### ONE

```solidity
uint8 constant ONE = 1;
```


### MAX_RATIO

```solidity
uint32 constant MAX_RATIO = 1000000;
```


### MIN_PRECISION

```solidity
uint8 constant MIN_PRECISION = 32;
```


### MAX_PRECISION

```solidity
uint8 constant MAX_PRECISION = 127;
```


### FIXED_1

```solidity
uint256 constant FIXED_1 = 0x080000000000000000000000000000000;
```


### FIXED_2

```solidity
uint256 constant FIXED_2 = 0x100000000000000000000000000000000;
```


### MAX_NUM

```solidity
uint256 constant MAX_NUM = 0x200000000000000000000000000000000;
```


### LN2_NUMERATOR

```solidity
uint256 constant LN2_NUMERATOR = 0x3f80fe03f80fe03f80fe03f80fe03f8;
```


### LN2_DENOMINATOR

```solidity
uint256 constant LN2_DENOMINATOR = 0x5b9de1d10bf4103d647b0955897ba80;
```


### OPT_LOG_MAX_VAL

```solidity
uint256 constant OPT_LOG_MAX_VAL = 0x15bf0a8b1457695355fb8ac404e7a79e3;
```


### OPT_EXP_MAX_VAL

```solidity
uint256 constant OPT_EXP_MAX_VAL = 0x800000000000000000000000000000000;
```


### MAX_EXP_ARRAY_VALUE

```solidity
uint256 constant MAX_EXP_ARRAY_VALUE = 0x1c35fedd14ffffffffffffffffffffffff;
```


### WAD

```solidity
uint256 constant WAD = 10 ** 18;
```


## Functions
### setUp


```solidity
function setUp() public;
```

### test_calculatePurchaseReturn


```solidity
function test_calculatePurchaseReturn() public view;
```

### test_RevertIf_InvalidCalculatePurchaseReturnInput


```solidity
function test_RevertIf_InvalidCalculatePurchaseReturnInput() public;
```

### test_PurchaseReturnDepositAmountZero


```solidity
function test_PurchaseReturnDepositAmountZero() public view;
```

### test_PurchaseReturnReserveRatioMax


```solidity
function test_PurchaseReturnReserveRatioMax() public view;
```

### test_RevertIf_InvalidCalculateSaleReturnInput


```solidity
function test_RevertIf_InvalidCalculateSaleReturnInput() public;
```

### test_SaleReturnSellAmountZero


```solidity
function test_SaleReturnSellAmountZero() public view;
```

### test_SaleReturnSellAmountEqualsSupply


```solidity
function test_SaleReturnSellAmountEqualsSupply() public view;
```

### test_SaleReturnReserveRatioMax


```solidity
function test_SaleReturnReserveRatioMax() public view;
```

### test_CalculatePurchaseReturn


```solidity
function test_CalculatePurchaseReturn() public view;
```

### test_CalculateSaleReturn


```solidity
function test_CalculateSaleReturn() public view;
```

### test_RevertPower


```solidity
function test_RevertPower() public;
```

### test_power


```solidity
function test_power() public view;
```

### test_findPositionInMaxExpArray


```solidity
function test_findPositionInMaxExpArray(uint256 x) public view;
```

### test_generalLog


```solidity
function test_generalLog(uint256 x) public view;
```

### test_floorLog2


```solidity
function test_floorLog2(uint256 x) public view;
```

### test_generalExp


```solidity
function test_generalExp(uint256 x) public view;
```

### test_optimalLog


```solidity
function test_optimalLog(uint256 x) public view;
```

### test_optimalExp


```solidity
function test_optimalExp(uint256 x) public view;
```

## Errors
### BancorFormula__InvalidInput

```solidity
error BancorFormula__InvalidInput();
```

