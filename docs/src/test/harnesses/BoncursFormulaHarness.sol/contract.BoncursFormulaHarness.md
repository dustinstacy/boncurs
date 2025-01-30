# BoncursFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/test/harnesses/BoncursFormulaHarness.sol)

**Inherits:**
[BoncursFormula](/contracts/experimental/BoncursFormula.sol/abstract.BoncursFormula.md)

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

