# LinFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/test/harnesses/LinFormulaHarness.sol)

**Inherits:**
[LinFormula](/contracts/linear/LinFormula.sol/abstract.LinFormula.md)

Used only for testing the LinFormula contract


## Functions
### calculatePurchaseReturn


```solidity
function calculatePurchaseReturn(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialPrice,
    uint32 scalingFactor,
    uint256 depositAmount
) external pure returns (uint256 purchaseReturn);
```

### calculateSaleReturn


```solidity
function calculateSaleReturn(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialReserve,
    uint32 scalingFactor,
    uint256 sellAmount
) external pure returns (uint256 saleReturn);
```

### currentTokenCost


```solidity
function currentTokenCost(uint256 currentToken, uint32 scalingFactor, uint256 initialPrice)
    external
    pure
    returns (uint256 tokenCost);
```

### totalCostOfTokens


```solidity
function totalCostOfTokens(uint256 currentToken, uint32 scalingFactor, uint256 initialPrice)
    external
    pure
    returns (uint256 totalCost);
```

### calculateTokenCount


```solidity
function calculateTokenCount(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialPrice,
    uint32 scalingFactor,
    uint256 depositAmount
) external pure returns (uint256 tokenCount);
```

### generalSqrt


```solidity
function generalSqrt(uint256 x) external pure returns (uint256 result);
```

### optimalSqrt


```solidity
function optimalSqrt(uint256 x) external pure returns (uint256 result);
```

### getLength


```solidity
function getLength(uint256 x) external pure returns (uint256 result);
```

