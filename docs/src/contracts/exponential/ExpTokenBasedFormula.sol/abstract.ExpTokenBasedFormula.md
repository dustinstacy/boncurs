# ExpTokenBasedFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/contracts/exponential/ExpTokenBasedFormula.sol)

**Author:**
Dustin Stacy

Provides functions for calculating the purchase and sale return values on an exponential token-based curve using a scaling factor
This formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return


## State Variables
### MAX_SCALE

```solidity
uint32 private constant MAX_SCALE = 1000000;
```


### WAD

```solidity
uint256 private constant WAD = 10 ** 18;
```


## Functions
### _calculateExpTokenBasedPurchaseCost

*given a token supply, initial price, scaling factor and a desired amount (in the main token),
calculates the cost for a given conversion (in the reserve token)*


```solidity
function _calculateExpTokenBasedPurchaseCost(uint256 supply, uint256 initialCost, uint32 scalingFactor, uint256 amount)
    internal
    pure
    returns (uint256 totalCost);
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
|`totalCost`|`uint256`|cost of the conversion|


### _calculateExpTokenBasedSaleReturn

*given a token supply, initial price, scaling factor and a desired amount (in the main token),
calculates the return for a given conversion (in the reserve token)*


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
|`scalingFactor`|`uint32`|scaling factor for the token|
|`amount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|cost of the conversion|


## Errors
### ExpTokenBasedFormula__InvalidInput

```solidity
error ExpTokenBasedFormula__InvalidInput();
```

