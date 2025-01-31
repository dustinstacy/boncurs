# ExpTokenBasedFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/415e7d62135e63eb569b341e480848bbb293bfa1/test/harnesses/ExpTokenBasedFormulaHarness.sol)

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

