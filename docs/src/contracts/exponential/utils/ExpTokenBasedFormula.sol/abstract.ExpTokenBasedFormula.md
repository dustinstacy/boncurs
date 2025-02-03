# ExpTokenBasedFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/contracts/exponential/utils/ExpTokenBasedFormula.sol)

This contract provides functions for calculating the purchase and sale return values on an exponential token-based curve using a scaling factor.
The formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return.


## State Variables
### MAX_SCALE
*Max reserve ratio in basis points*


```solidity
uint32 private constant MAX_SCALE = 1000000;
```


### WAD
*Wei as decimal precision for calculations*


```solidity
uint256 private constant WAD = 10 ** 18;
```


## Functions
### _calculateExpTokenBasedPurchaseCost

Returns the purchase cost for a given conversion (in the reserve token) for a desired amount (in the main token).


```solidity
function _calculateExpTokenBasedPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
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


### _calculateExpTokenBasedSaleReturn

Returns the sale value for a given amount (in the main token) as a conversion into the reserve token.


```solidity
function _calculateExpTokenBasedSaleReturn(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
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
|`amount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


## Errors
### ExpTokenBasedFormula__InvalidInput

```solidity
error ExpTokenBasedFormula__InvalidInput();
```

