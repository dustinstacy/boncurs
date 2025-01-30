# ExpTokenBasedFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/8dd3d6e20d7e085dbf2dccdde2c14001616467cf/test/harnesses/ExpTokenBasedFormulaHarness.sol)

**Inherits:**
[ExpTokenBasedFormula](/contracts/exponential/ExpTokenBasedFormula.sol/abstract.ExpTokenBasedFormula.md)

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

