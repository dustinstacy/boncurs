# LinTokenBasedCurve
[Git Source](https://github.com/dustinstacy/boncurs/blob/6861bbaeffdf2c0b5dfedce7a811f914c75775e3/src/contracts/linear/LinTokenBasedCurve.sol)

**Inherits:**
[LinTokenBasedFormula](/src/contracts/linear/LinTokenBasedFormula.sol/abstract.LinTokenBasedFormula.md)

**Author:**
Dustin Stacy

Used to get the purchase and sale return values for a linear token-based curve


## Functions
### getPurchaseCost


```solidity
function getPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
    internal
    pure
    returns (uint256 costToMint);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor for the token|
|`amount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`costToMint`|`uint256`|cost of the conversion|


### getSaleReturn


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
|`scalingFactor`|`uint32`|scaling factor for the token|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


