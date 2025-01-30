# ExpTokenBasedFormulaTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/test/ExpTokenBasedFormula.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## State Variables
### harness

```solidity
ExpTokenBasedFormulaHarness public harness;
```


### MAX_SCALE

```solidity
uint32 private constant MAX_SCALE = 1000000;
```


### WAD

```solidity
uint256 private constant WAD = 10 ** 18;
```


### ONE

```solidity
uint32 constant ONE = 1;
```


### HALF_SCALE

```solidity
uint32 constant HALF_SCALE = 5000;
```


## Functions
### setUp


```solidity
function setUp() public;
```

### test_calculateExpTokenBasedPurchaseCost


```solidity
function test_calculateExpTokenBasedPurchaseCost() public view;
```

### test_calculateExpTokenBasedPurchaseCost2


```solidity
function test_calculateExpTokenBasedPurchaseCost2() public view;
```

### test_calculateExpTokenBasedPurchaseCost3


```solidity
function test_calculateExpTokenBasedPurchaseCost3() public view;
```

### test_calculateExpTokenBasedPurchaseCost4


```solidity
function test_calculateExpTokenBasedPurchaseCost4() public view;
```

### test_calculateExpTokenBasedPurchaseCost5


```solidity
function test_calculateExpTokenBasedPurchaseCost5() public view;
```

### test_calculateExpTokenBasedPurchaseCost6


```solidity
function test_calculateExpTokenBasedPurchaseCost6() public view;
```

### test_calculateExpTokenBasedPurchaseCost7


```solidity
function test_calculateExpTokenBasedPurchaseCost7() public view;
```

### test_calculateExpTokenBasedPurchaseCost8


```solidity
function test_calculateExpTokenBasedPurchaseCost8() public view;
```

### test_calculateExpTokenBasedPurchaseCost9


```solidity
function test_calculateExpTokenBasedPurchaseCost9() public view;
```

### test_calculateExpTokenBasedPurchaseCost10


```solidity
function test_calculateExpTokenBasedPurchaseCost10() public view;
```

### test_calculateExpTokenBasedPurchaseCost11


```solidity
function test_calculateExpTokenBasedPurchaseCost11() public view;
```

### test_RevertIf_InvalidCalculateExpTokenBasedPurchaseCostInput


```solidity
function test_RevertIf_InvalidCalculateExpTokenBasedPurchaseCostInput() public;
```

### test_calculateExpTokenBasedPurchaseCostReturnsZero


```solidity
function test_calculateExpTokenBasedPurchaseCostReturnsZero() public view;
```

### test_calculateExpTokenBasedPurchaseCostReturnsInitialCost


```solidity
function test_calculateExpTokenBasedPurchaseCostReturnsInitialCost() public view;
```

### test_RevertIf_InvalidCalculateExpTokenBasedSaleReturnInput


```solidity
function test_RevertIf_InvalidCalculateExpTokenBasedSaleReturnInput() public;
```

### test_calculateExpTokenBasedSaleReturnReturnsZero


```solidity
function test_calculateExpTokenBasedSaleReturnReturnsZero() public view;
```

## Errors
### ExpTokenBasedFormula__InvalidInput

```solidity
error ExpTokenBasedFormula__InvalidInput();
```

