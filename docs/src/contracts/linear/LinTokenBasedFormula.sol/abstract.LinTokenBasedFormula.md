# LinTokenBasedFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/contracts/linear/LinTokenBasedFormula.sol)

**Author:**
Dustin Stacy

Provides functions for calculating the purchase and sale return values on a linear token-based curve using a scaling factor
This formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return


## State Variables
### MAX_SCALE

```solidity
uint32 private constant MAX_SCALE = 1000000;
```


### PURE_LINEAR_SCALE

```solidity
uint32 private constant PURE_LINEAR_SCALE = 10000;
```


### WAD

```solidity
uint256 private constant WAD = 10 ** 18;
```


## Functions
### _calculateLinTokenBasedPurchaseCost

*given a token supply, initial price, scaling factor and a desired amount (in the main token),
calculates the cost for a given conversion (in the reserve token)*


```solidity
function _calculateLinTokenBasedPurchaseCost(uint256 supply, uint256 initialCost, uint256 scalingFactor, uint256 amount)
    internal
    pure
    returns (uint256 totalCost);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint256`|scaling factor for the token|
|`amount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`totalCost`|`uint256`|cost of the conversion|


### _calculateLinTokenBasedSaleReturn

*given a token supply, initial price, scaling factor and a desired amount (in the main token),
calculates the return for a given conversion (in the reserve token)*


```solidity
function _calculateLinTokenBasedSaleReturn(uint256 supply, uint256 initialCost, uint256 scalingFactor, uint256 amount)
    internal
    pure
    returns (uint256 saleReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint256`|scaling factor for the token|
|`amount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|cost of the conversion|


## Errors
### LinTokenBasedFormula__InvalidInput

```solidity
error LinTokenBasedFormula__InvalidInput();
```

