# LinCurve
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/contracts/linear/LinCurve.sol)

**Inherits:**
[LinFormula](/contracts/linear/utils/LinFormula.sol/abstract.LinFormula.md)

This contract is used to get the purchase and sale return values for a linear curve.


## Functions
### getPurchaseReturn

Returns the purchase value using a Linear Curve.


```solidity
function getPurchaseReturn(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialCost,
    uint32 scalingFactor,
    uint256 depositAmount
) internal pure returns (uint256 purchaseReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|current balance of the reserve token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in ppm, 1-1000000  token|
|`depositAmount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseReturn`|`uint256`|return of the conversion|


### getSaleReturn

Returns the sale value using a Linear Curve.


```solidity
function getSaleReturn(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialCost,
    uint32 scalingFactor,
    uint256 sellAmount
) internal pure returns (uint256 saleReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|balance of the reserve token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in ppm, 1-1000000  token|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


