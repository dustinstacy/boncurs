# LinFormulaTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/test/LinFormula.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)

Test to ensure that the Linear Formula calculations are correct


## State Variables
### harness

```solidity
LinFormulaHarness public harness;
```


### MAX_SCALE

```solidity
uint32 constant MAX_SCALE = 100000000;
```


### PURE_LINEAR_SCALE

```solidity
uint32 constant PURE_LINEAR_SCALE = 1000000;
```


### WAD

```solidity
uint256 constant WAD = 10 ** 18;
```


### OPTIMAL_TERM_MAX_VAL

```solidity
uint256 constant OPTIMAL_TERM_MAX_VAL = 0x6a;
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

### test_LinFormulaCalculations


```solidity
function test_LinFormulaCalculations() public view;
```

### test_LinFormulaCalculations2


```solidity
function test_LinFormulaCalculations2() public view;
```

### test_LinFormulaCalculations3


```solidity
function test_LinFormulaCalculations3() public view;
```

### test_LinFormulaCalculations4


```solidity
function test_LinFormulaCalculations4() public view;
```

### test_LinFormulaCalculations5


```solidity
function test_LinFormulaCalculations5() public view;
```

### test_LinFormulaCalculations6


```solidity
function test_LinFormulaCalculations6() public view;
```

### test_LinFormulaCalculations7


```solidity
function test_LinFormulaCalculations7() public view;
```

### test_LinFormulaCalculations8


```solidity
function test_LinFormulaCalculations8() public view;
```

### test_LinFormulaCalculations9


```solidity
function test_LinFormulaCalculations9() public view;
```

### test_LinFormulaCalculations10


```solidity
function test_LinFormulaCalculations10() public view;
```

### test_RevertIf_InvalidCalculateLinPurchaseReturnInput


```solidity
function test_RevertIf_InvalidCalculateLinPurchaseReturnInput() public;
```

### test_LinPurchaseReturnDepositAmountZero


```solidity
function test_LinPurchaseReturnDepositAmountZero() public view;
```

### test_RevertIf_InvalidCalculateLinSaleReturnInput


```solidity
function test_RevertIf_InvalidCalculateLinSaleReturnInput() public;
```

### test_LinSaleReturnDepositAmountZero


```solidity
function test_LinSaleReturnDepositAmountZero() public view;
```

### test_LinSaleReturnSellAmountEqualsSupply


```solidity
function test_LinSaleReturnSellAmountEqualsSupply() public view;
```

### test_currentTokenCost


```solidity
function test_currentTokenCost() public view;
```

### test_currentTokenCost2


```solidity
function test_currentTokenCost2() public view;
```

### test_currentTokenCost3


```solidity
function test_currentTokenCost3() public view;
```

### test_currentTokenCost4


```solidity
function test_currentTokenCost4() public view;
```

### test_totalCostOfTokens


```solidity
function test_totalCostOfTokens() public view;
```

### test_totalCostOfTokens2


```solidity
function test_totalCostOfTokens2() public view;
```

### test_totalCostOfTokens3


```solidity
function test_totalCostOfTokens3() public view;
```

### test_totalCostOfTokens4


```solidity
function test_totalCostOfTokens4() public view;
```

### test_calculateTokenCount


```solidity
function test_calculateTokenCount() public view;
```

### test_calculateTokenCount2


```solidity
function test_calculateTokenCount2() public view;
```

### test_calculateTokenCount3


```solidity
function test_calculateTokenCount3() public view;
```

### test_optimalSqrt


```solidity
function test_optimalSqrt() public view;
```

### test_optimalSqrt2


```solidity
function test_optimalSqrt2() public view;
```

### test_optimalSqrt3


```solidity
function test_optimalSqrt3() public view;
```

### test_optimalSqrt4


```solidity
function test_optimalSqrt4() public view;
```

### test_generalSqrt


```solidity
function test_generalSqrt() public view;
```

### test_generalSqrt2


```solidity
function test_generalSqrt2() public view;
```

### test_generalSqrt3


```solidity
function test_generalSqrt3() public view;
```

### test_generalSqrt4


```solidity
function test_generalSqrt4() public view;
```

### test_getLength


```solidity
function test_getLength() public view;
```

### test_getLength2


```solidity
function test_getLength2() public view;
```

### test_getLength3


```solidity
function test_getLength3() public view;
```

### test_getLength4


```solidity
function test_getLength4() public view;
```

## Errors
### LinFormula__InvalidInput

```solidity
error LinFormula__InvalidInput();
```

