# ExpCurve
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/contracts/exponential/ExpCurve.sol)

**Inherits:**
[BancorFormula](/contracts/exponential/utils/BancorFormula.sol/abstract.BancorFormula.md)

This contract is used to get the purchase and sale return values for an exponential curve.


## Functions
### getPurchaseReturn

Returns the purchase value using an Exponential Curve.


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
|`reserveBalance`|`uint256`|balance of the reserve token|
|`reserveRatio`|`uint32`|reserve ratio of the token|
|`depositAmount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseReturn`|`uint256`|cost of the conversion|


### getSaleReturn

Returns the sale value using an Exponential Curve.


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
|`reserveBalance`|`uint256`|balance of the reserve token|
|`reserveRatio`|`uint32`|reserve ratio of the token|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


