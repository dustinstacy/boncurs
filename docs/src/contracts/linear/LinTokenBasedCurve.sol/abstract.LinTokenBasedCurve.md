# LinTokenBasedCurve
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/contracts/linear/LinTokenBasedCurve.sol)

**Inherits:**
[LinTokenBasedFormula](/contracts/linear/utils/LinTokenBasedFormula.sol/abstract.LinTokenBasedFormula.md)

This contract is used to get the purchase and sale return values for a linear token based curve.


## Functions
### getPurchaseCost

Returns the purchase cost using a Linear Token Based Curve.


```solidity
function getPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
    internal
    pure
    returns (uint256 purchaseCost);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in basis points, 1-10000|
|`amount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseCost`|`uint256`|cost of the conversion|


### getSaleReturn

Returns the sale value using a Linear Token Based Curve.


```solidity
function getSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 sellAmount)
    internal
    pure
    returns (uint256 saleReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in basis points, 1-10000|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


