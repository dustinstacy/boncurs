# BoncursFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/52a092a7ad60aeeee3132e910b32ca470eb8882d/contracts/experimental/BoncursFormula.sol)

**Author:**
Dustin Stacy

Provides functions for calculating the purchase and sale return values on a uinque curve using a scaling factor
This formula converts a desired token amount into a reserve token cost and the sale of a token amount into a reserve token return
This formula is a custom curve that sees an initial diminishing return on the cost to mint a token, but as the supply increases
and the reserve balance grows, the value of the token increases and cannot go down. Used to reward early adopters and incentivize
the holding of the token. Also, with the way the curve tends to move towards flat over time, it does not punish late adopters.
Great for a token that is meant to be held and not traded often or as a community engagement token.
i.e. staking tokens, governance tokens, group membership tokens, game assets, etc.


## State Variables
### MIN_SCALE

```solidity
uint32 constant MIN_SCALE = 10000;
```


### MAX_SCALE

```solidity
uint256 constant MAX_SCALE = 1000000;
```


### WAD

```solidity
uint256 constant WAD = 10 ** 18;
```


## Functions
### _calculateBoncursPurchaseCost

*given a token supply, reserve balance, initial cost, scaling factor and a desired amount (in the main token),
calculates the cost for a given conversion (in the reserve token)*


```solidity
function _calculateBoncursPurchaseCost(
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
|`scalingFactor`|`uint32`|scaling factor for the token|
|`amount`|`uint256`|amount of tokens to purchase|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`costToMint`|`uint256`|cost of the conversion|


### _calculateBoncursSaleReturn

*given a token supply, reserve balance, and a desired sell amount (in the main token),
calculates the return for a given conversion (in the reserve token)*


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
|`reserveBalance`|`uint256`|reserve balance of the token|
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

