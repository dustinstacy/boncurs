# BoncursFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/test/harnesses/BoncursFormulaHarness.sol)

**Inherits:**
[BoncursFormula](/contracts/experimental/utils/BoncursFormula.sol/abstract.BoncursFormula.md)

Used only for testing the BoncursFormula contract


## Functions
### calculateBoncursPurchaseCost


```solidity
function calculateBoncursPurchaseCost(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialCost,
    uint32 scalingFactor,
    uint256 amount
) external pure returns (uint256 totalCost);
```

### calculateBoncursSaleReturn


```solidity
function calculateBoncursSaleReturn(uint256 supply, uint256 reserveBalance, uint256 sellAmount)
    external
    pure
    returns (uint256 saleReturn);
```

