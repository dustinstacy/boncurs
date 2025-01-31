# BoncursFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/test/harnesses/BoncursFormulaHarness.sol)

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

