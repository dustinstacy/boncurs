# ExpCurve
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/contracts/exponential/ExpCurve.sol)

**Inherits:**
[BancorFormula](/contracts/exponential/BancorFormula.sol/abstract.BancorFormula.md)

**Author:**
Dustin Stacy

Used to get the purchase and sale return values for an exponential curve


## Functions
### getPurchaseReturn


```solidity
function getPurchaseReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 depositAmount)
    internal
    view
    returns (uint256 purchaseReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|reserve balance of the token|
|`reserveRatio`|`uint32`|reserve ratio of the token|
|`depositAmount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseReturn`|`uint256`|cost of the conversion|


### getSaleReturn


```solidity
function getSaleReturn(uint256 supply, uint256 reserveBalance, uint32 reserveRatio, uint256 sellAmount)
    internal
    view
    returns (uint256 saleReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|reserve balance of the token|
|`reserveRatio`|`uint32`|reserve ratio of the token|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


