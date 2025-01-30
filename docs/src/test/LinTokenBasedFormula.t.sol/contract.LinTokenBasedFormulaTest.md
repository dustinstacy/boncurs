# LinTokenBasedFormulaTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/8dd3d6e20d7e085dbf2dccdde2c14001616467cf/test/LinTokenBasedFormula.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## State Variables
### harness

```solidity
LinTokenBasedFormulaHarness public harness;
```


### MAX_SCALE

```solidity
uint32 constant MAX_SCALE = 1000000;
```


### PURE_LINEAR_SCALE

```solidity
uint32 constant PURE_LINEAR_SCALE = 10000;
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

### test_calculateLinTokenBasedPurchaseCost


```solidity
function test_calculateLinTokenBasedPurchaseCost() public view;
```

### test_calculateLinTokenBasedPurchaseCost2


```solidity
function test_calculateLinTokenBasedPurchaseCost2() public view;
```

### test_calculateLinTokenBasedPurchaseCost3


```solidity
function test_calculateLinTokenBasedPurchaseCost3() public view;
```

### test_calculateLinTokenBasedPurchaseCost4


```solidity
function test_calculateLinTokenBasedPurchaseCost4() public view;
```

### test_calculateLinTokenBasedPurchaseCost5


```solidity
function test_calculateLinTokenBasedPurchaseCost5() public view;
```

### test_calculateLinTokenBasedPurchaseCost6


```solidity
function test_calculateLinTokenBasedPurchaseCost6() public view;
```

### test_calculateLinTokenBasedPurchaseCost7


```solidity
function test_calculateLinTokenBasedPurchaseCost7() public view;
```

### test_calculateLinTokenBasedPurchaseCost8


```solidity
function test_calculateLinTokenBasedPurchaseCost8() public view;
```

### test_calculateLinTokenBasedPurchaseCost9


```solidity
function test_calculateLinTokenBasedPurchaseCost9() public view;
```

### test_calculateLinTokenBasedPurchaseCost10


```solidity
function test_calculateLinTokenBasedPurchaseCost10() public view;
```

### test_calculateLinTokenBasedPurchaseCost11


```solidity
function test_calculateLinTokenBasedPurchaseCost11() public view;
```

### test_RevertIf_InvalidCalculateLinTokenBasedPurchaseCostInput


```solidity
function test_RevertIf_InvalidCalculateLinTokenBasedPurchaseCostInput() public;
```

### test_calculateLinTokenBasedPurchaseCostReturnsZero


```solidity
function test_calculateLinTokenBasedPurchaseCostReturnsZero() public view;
```

### test_calculateLinTokenBasedPurchaseCostReturnsInitialCost


```solidity
function test_calculateLinTokenBasedPurchaseCostReturnsInitialCost() public view;
```

### test_RevertIf_InvalidCalculateLinTokenBasedSaleReturnInput


```solidity
function test_RevertIf_InvalidCalculateLinTokenBasedSaleReturnInput() public;
```

### test_calculateLinTokenBasedSaleReturnReturnsZero


```solidity
function test_calculateLinTokenBasedSaleReturnReturnsZero() public view;
```

## Errors
### LinTokenBasedFormula__InvalidInput

```solidity
error LinTokenBasedFormula__InvalidInput();
```

