# LinTokenBasedFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/test/harnesses/LinTokenBasedFormulaHarness.sol)

**Inherits:**
[LinTokenBasedFormula](/contracts/linear/utils/LinTokenBasedFormula.sol/abstract.LinTokenBasedFormula.md)

Used only for testing the LinTokenBasedFormula contract


## Functions
### calculateLinTokenBasedPurchaseCost


```solidity
function calculateLinTokenBasedPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
    public
    pure
    returns (uint256 totalCost);
```

### calculateLinTokenBasedSaleReturn


```solidity
function calculateLinTokenBasedSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
    public
    pure
    returns (uint256 saleReturn);
```

