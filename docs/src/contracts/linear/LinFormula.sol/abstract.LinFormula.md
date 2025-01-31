# LinFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/415e7d62135e63eb569b341e480848bbb293bfa1/contracts/linear/LinFormula.sol)

**Author:**
Dustin Stacy

Provides functions for calculating the purchase and sale return values on a linear curve using a scaling factor
This formula converts a given reserve token amount to a token amount and vice versa


## State Variables
### MAX_SCALE

```solidity
uint32 private constant MAX_SCALE = 100000000;
```


### PURE_LINEAR_SCALE

```solidity
uint32 private constant PURE_LINEAR_SCALE = 1000000;
```


### WAD

```solidity
uint256 private constant WAD = 10 ** 18;
```


### OPTIMAL_TERM_MAX_VAL
*Value that represents the point at which the optimal function approximations are still effective*


```solidity
uint256 private constant OPTIMAL_TERM_MAX_VAL = 0x6a;
```


## Functions
### _calculateLinPurchaseReturn

*given a token supply, reserve balance, initial price, scaling factor and a deposit amount (in the reserve token),
calculates the return for a given conversion (in the main token)
If the deposit amount is less than the current token balance, the return is calculated based on the current token cost.
If the deposit amount is greater than the current token balance, the variables are caliabrated to move to the next token.
Then amount of whole tokens the deposit can stil cover is calculated using a sum of an arithmetic series rounded down to the nearest integer.
If there is a remainder, the final addition to the return is calculated based on the new current token cost.*


```solidity
function _calculateLinPurchaseReturn(
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
|`supply`|`uint256`|           token total supply|
|`reserveBalance`|`uint256`|   total reserve balance|
|`initialCost`|`uint256`|     initial price of the token|
|`scalingFactor`|`uint32`|    scaling factor for the token|
|`depositAmount`|`uint256`|    deposit amount, in reserve token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseReturn`|`uint256`|return amount|


### _calculateLinSaleReturn

*given a token supply, reserve balance, initial price, scaling factor and a sell amount (in the main token),
calculates the return for a given conversion (in the reserve token)
If the sell amount is less than the current token fragment, the return is calculated based on the current token cost.
If the sell amount is greater than the current token fragment, the variables are calibrated to move to the previous token.
Then the amount of whole tokens left in the sale is converted to the reserve token and added to the return.
If there is a remainder, the final addition to the return is calculated based on the new current token cost.*


```solidity
function _calculateLinSaleReturn(
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
|`supply`|`uint256`|           token total supply|
|`reserveBalance`|`uint256`|   total reserve|
|`initialCost`|`uint256`|     initial price of the token|
|`scalingFactor`|`uint32`|    scaling factor for the token|
|`sellAmount`|`uint256`|       sell amount, in the token itself|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return amount|


### _totalCostOfTokens

Calculate the total cost of tokens up to the current token


```solidity
function _totalCostOfTokens(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
    internal
    pure
    returns (uint256 tokenCost);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`currentToken`|`uint256`|The current token number|
|`scalingFactor`|`uint32`|The scaling factor for the token|
|`initialCost`|`uint256`|The initial price of the token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`tokenCost`|`uint256`|The total cost of tokens up to the current token|


### _currentTokenCost

Calculate the current token cost


```solidity
function _currentTokenCost(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
    internal
    pure
    returns (uint256 currentTokenCost);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`currentToken`|`uint256`|The current token number|
|`scalingFactor`|`uint32`|The scaling factor for the token|
|`initialCost`|`uint256`|The initial price of the token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`currentTokenCost`|`uint256`|The current token cost|


### _calculateInitialCostAdjustment


```solidity
function _calculateInitialCostAdjustment(uint256 initialCost, uint32 scalingFactor)
    internal
    pure
    returns (uint256 initialCostAdjustment);
```

### _calculateTokenCount

Calculate the amount of whole tokens the deposit can still cover


```solidity
function _calculateTokenCount(
    uint256 depositAmount,
    uint256 reserveBalance,
    uint256 initialCost,
    uint32 scalingFactor,
    uint256 currentToken
) internal pure returns (uint256 tokenCount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`depositAmount`|`uint256`|The deposit amount, in reserve token|
|`reserveBalance`|`uint256`|The total reserve balance|
|`initialCost`|`uint256`|The initial price of the token|
|`scalingFactor`|`uint32`||
|`currentToken`|`uint256`|The current token number|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`tokenCount`|`uint256`|The amount of whole tokens the deposit can still cover|


### _generalSqrt


```solidity
function _generalSqrt(uint256 x) internal pure returns (uint128);
```

### _optimalSqrt


```solidity
function _optimalSqrt(uint256 y) internal pure returns (uint256 z);
```

### _getLength


```solidity
function _getLength(uint256 x) internal pure returns (uint256);
```

## Errors
### LinFormula__InvalidInput

```solidity
error LinFormula__InvalidInput();
```

