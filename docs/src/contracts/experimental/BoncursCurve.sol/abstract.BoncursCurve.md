# BoncursCurve
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/contracts/experimental/BoncursCurve.sol)

**Inherits:**
[BoncursFormula](/contracts/experimental/BoncursFormula.sol/abstract.BoncursFormula.md)

**Author:**
Dustin Stacy

Used to get the purchase and sale return values for a Boncurs curve.


## Functions
### getPurchaseCost

Get Purchase Cost for Boncurs Curve.


```solidity
function getPurchaseCost(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialCost,
    uint32 scalingFactor,
    uint256 amount
) internal pure returns (uint256 costToMint);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|reserve balance of the token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor of the curve|
|`amount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`costToMint`|`uint256`|cost of the conversion|


### getSaleReturn

Get Sale Return for Boncurs Curve


```solidity
function getSaleReturn(uint256 supply, uint256 reserveBalance, uint256 sellAmount)
    internal
    pure
    returns (uint256 saleReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|reserve balance of the token|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


