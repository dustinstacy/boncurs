# ExpTokenBasedFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/test/harnesses/ExpTokenBasedFormulaHarness.sol)

**Inherits:**
[ExpTokenBasedFormula](/contracts/exponential/utils/ExpTokenBasedFormula.sol/abstract.ExpTokenBasedFormula.md)

Used only for testing the ExpTokenBasedFormula contract


## Functions
### calculateExpTokenBasedPurchaseCost


```solidity
function calculateExpTokenBasedPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
    public
    pure
    returns (uint256 totalCost);
```

### calculateExpTokenBasedSaleReturn


```solidity
function calculateExpTokenBasedSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
    public
    pure
    returns (uint256 saleReturn);
```

