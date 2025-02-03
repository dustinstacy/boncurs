# BoncursFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/contracts/experimental/utils/BoncursFormula.sol)

This contract provides functions for calculating the purchase and sale return values on a uinque curve using a scaling factor.
The formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return.

This formula is a custom curve that sees an initial diminishing return on the cost to mint a token, but as the supply increases
and the reserve balance grows, the value of the token increases and cannot go down. Used to reward early adopters and incentivize
the holding of the token. Also, with the way the curve tends to move towards flat over time, it does not punish late adopters.


## State Variables
### MIN_SCALE
*Minimum scale in basis points. Prevents loss of value.*


```solidity
uint32 constant MIN_SCALE = 10000;
```


### MAX_SCALE
*Maximum scale in basis points.*


```solidity
uint32 constant MAX_SCALE = 1000000;
```


### WAD
*Wei as decimal precision for calculations.*


```solidity
uint256 constant WAD = 10 ** 18;
```


## Functions
### _calculateBoncursPurchaseCost

Returns the purchase cost for a given conversion (in the reserve token) for a desired amount (in the main token).


```solidity
function _calculateBoncursPurchaseCost(
    uint256 supply,
    uint256 reserveBalance,
    uint256 initialCost,
    uint32 scalingFactor,
    uint256 amount
) internal pure returns (uint256 purchaseCost);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|current balance of the reserve token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in basis points, 1-10000|
|`amount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseCost`|`uint256`|cost of the conversion|


### _calculateBoncursSaleReturn

Returns the sale value for a given amount (in the main token) as a conversion into the reserve token.


```solidity
function _calculateBoncursSaleReturn(uint256 supply, uint256 reserveBalance, uint256 amount)
    internal
    pure
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|current balance of the reserve token|
|`amount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|saleReturn return of the conversion|


## Errors
### BoncursFormula__InvalidInput

```solidity
error BoncursFormula__InvalidInput();
```

