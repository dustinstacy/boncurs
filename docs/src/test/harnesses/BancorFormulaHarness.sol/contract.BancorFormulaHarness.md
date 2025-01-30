# BancorFormulaHarness
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/test/harnesses/BancorFormulaHarness.sol)

**Inherits:**
[BancorFormula](/contracts/exponential/BancorFormula.sol/abstract.BancorFormula.md)

Used only for testing the BancorFormula contract


## Functions
### calculatePurchaseReturn


```solidity
function calculatePurchaseReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 depositAmount)
    external
    view
    returns (uint256 purchaseReturn);
```

### calculateSaleReturn


```solidity
function calculateSaleReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 sellAmount)
    external
    view
    returns (uint256 saleReturn);
```

### power


```solidity
function power(uint256 baseN, uint256 baseD, uint32 expN, uint32 expD)
    external
    view
    returns (uint256 result, uint256 precision);
```

### generalLog


```solidity
function generalLog(uint256 x) external pure returns (uint256 result);
```

### floorLog2


```solidity
function floorLog2(uint256 x) external pure returns (uint8 result);
```

### findPositionInMaxExpArray


```solidity
function findPositionInMaxExpArray(uint256 x) external view returns (uint8 position);
```

### generalExp


```solidity
function generalExp(uint256 x, uint8 precision) external pure returns (uint256 result);
```

### optimalLog


```solidity
function optimalLog(uint256 x) external pure returns (uint256 result);
```

### optimalExp


```solidity
function optimalExp(uint256 x) external pure returns (uint256 result);
```

