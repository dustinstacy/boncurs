# LinTokenBasedFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/8dd3d6e20d7e085dbf2dccdde2c14001616467cf/test/harnesses/LinTokenBasedFormulaHarness.sol)

**Inherits:**
[LinTokenBasedFormula](/contracts/linear/LinTokenBasedFormula.sol/abstract.LinTokenBasedFormula.md)

Used only for testing the LinTokenBasedFormula contract


## Functions
### calculateLinTokenBasedPurchaseCost


```solidity
function calculateLinTokenBasedPurchaseCost(uint256 supply, uint256 initialCost, uint256 scalingFactor, uint256 amount)
    public
    pure
    returns (uint256 totalCost);
```

### calculateLinTokenBasedSaleReturn


```solidity
function calculateLinTokenBasedSaleReturn(uint256 supply, uint256 initialCost, uint256 scalingFactor, uint256 amount)
    public
    pure
    returns (uint256 saleReturn);
```

