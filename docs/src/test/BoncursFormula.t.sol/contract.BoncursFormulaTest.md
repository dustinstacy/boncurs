# BoncursFormulaTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/8dd3d6e20d7e085dbf2dccdde2c14001616467cf/test/BoncursFormula.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## State Variables
### harness

```solidity
BoncursFormulaHarness public harness;
```


### MIN_SCALE

```solidity
uint32 constant MIN_SCALE = 10000;
```


### MAX_SCALE

```solidity
uint32 constant MAX_SCALE = 1000000;
```


### WAD

```solidity
uint256 constant WAD = 10 ** 18;
```


### ONE

```solidity
uint32 constant ONE = 1;
```


## Functions
### setUp


```solidity
function setUp() public;
```

### test_calculateBoncursPurchaseCost


```solidity
function test_calculateBoncursPurchaseCost() public view;
```

### test_calculateBoncursPurchaseCost2


```solidity
function test_calculateBoncursPurchaseCost2() public view;
```

### test_calculateBoncursPurchaseCost3


```solidity
function test_calculateBoncursPurchaseCost3() public view;
```

### test_calculateBoncursPurchaseCost4


```solidity
function test_calculateBoncursPurchaseCost4() public view;
```

### test_calculateBoncursPurchaseCost5


```solidity
function test_calculateBoncursPurchaseCost5() public view;
```

### test_RevertIf_InvalidCalculateBoncursPurchaseCostInput


```solidity
function test_RevertIf_InvalidCalculateBoncursPurchaseCostInput() public;
```

### test_calculateBoncursPurchaseCostReturnsZero


```solidity
function test_calculateBoncursPurchaseCostReturnsZero() public view;
```

### test_calculateBoncursPurchaseCostReturnsInitialCost


```solidity
function test_calculateBoncursPurchaseCostReturnsInitialCost() public view;
```

### test_calculateBoncursSaleReturnReturnsZero


```solidity
function test_calculateBoncursSaleReturnReturnsZero() public view;
```

## Errors
### BoncursFormula__InvalidInput

```solidity
error BoncursFormula__InvalidInput();
```

