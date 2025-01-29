# LinCurve
[Git Source](https://github.com/dustinstacy/boncurs/blob/6861bbaeffdf2c0b5dfedce7a811f914c75775e3/src/contracts/linear/LinCurve.sol)

**Inherits:**
[LinFormula](/src/contracts/linear/LinFormula.sol/abstract.LinFormula.md)

**Author:**
Dustin Stacy

Used to get the purchase and sale return values for a linear curve


## Functions
### getPurchaseReturn


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
|`reserveBalance`|`uint256`|reserve balance of the token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor for the token|
|`depositAmount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseReturn`|`uint256`|cost of the conversion|


### getSaleReturn


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
|`reserveBalance`|`uint256`|reserve balance of the token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor for the token|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


