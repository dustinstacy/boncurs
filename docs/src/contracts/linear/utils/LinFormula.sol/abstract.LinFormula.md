# LinFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/contracts/linear/utils/LinFormula.sol)

This contract provides functions for calculating the purchase and sale return values on a linear curve using a scaling factor.
The formula converts a given reserve token amount into a token return and the sale of a token amount into a reserve token return.


## State Variables
### OPTIMAL_TERM_MAX_VAL
*Value that represents the point at which the optimal function approximations are still effective*


```solidity
uint8 private constant OPTIMAL_TERM_MAX_VAL = 0x6a;
```


### MAX_SCALE
*Max scaling factor in parts per million*


```solidity
uint32 private constant MAX_SCALE = 100000000;
```


### PURE_LINEAR_SCALE
*1:1 scaling factor in parts per million*


```solidity
uint32 private constant PURE_LINEAR_SCALE = 1000000;
```


### WAD
*Wei as decimal precision for calculations*


```solidity
uint256 private constant WAD = 10 ** 18;
```


## Functions
### _calculateLinPurchaseReturn

Returns the purchase value for a given amount (in the reserve token) as a conversion into the main token.


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
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|balance of the reserve token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in ppm, 1-1000000|
|`depositAmount`|`uint256`|deposit amount, in reserve token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseReturn`|`uint256`|return amount|


### _calculateLinSaleReturn

Returns the sale value for a given amount (in the main token) as a conversion into the reserve token.


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
|`supply`|`uint256`|token total supply|
|`reserveBalance`|`uint256`|balance of the reserve token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in ppm, 1-1000000|
|`sellAmount`|`uint256`|amount of tokens to sell|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return of the conversion|


### _totalCostOfTokens

Returns the total cost of tokens up to the current token.


```solidity
function _totalCostOfTokens(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
    internal
    pure
    returns (uint256 totalCost);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`currentToken`|`uint256`|current token number|
|`scalingFactor`|`uint32`|scaling factor, represented in ppm, 1-1000000|
|`initialCost`|`uint256`|initial cost of the token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`totalCost`|`uint256`|total cost of tokens up to the current token|


### _currentTokenCost

Returns the cost of the current token.


```solidity
function _currentTokenCost(uint256 currentToken, uint32 scalingFactor, uint256 initialCost)
    internal
    pure
    returns (uint256 currentTokenCost);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`currentToken`|`uint256`|current token number|
|`scalingFactor`|`uint32`|scaling factor, represented in ppm, 1-1000000|
|`initialCost`|`uint256`|initial cost of the token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`currentTokenCost`|`uint256`|current token cost|


### _calculateInitialCostAdjustment

Returns the initial cost adjustment based on the scaling factor.

*Calculates the difference between the initial cost and the incremental value applied to each token after the first.*


```solidity
function _calculateInitialCostAdjustment(uint256 initialCost, uint32 scalingFactor)
    internal
    pure
    returns (uint256 initialCostAdjustment);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`|scaling factor, represented in ppm, 1-1000000|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`initialCostAdjustment`|`uint256`|initial cost adjustment|


### _calculateTokenCount

Returns the amount of whole tokens the deposit can still cover.


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
|`depositAmount`|`uint256`|deposit amount, in reserve token|
|`reserveBalance`|`uint256`|balance of the reserve token|
|`initialCost`|`uint256`|initial cost of the token|
|`scalingFactor`|`uint32`||
|`currentToken`|`uint256`|current token number|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`tokenCount`|`uint256`|amount of whole tokens the deposit can still cover|


### _generalSqrt

Returns the square root of a given value as proposed in EIP-7054.


```solidity
function _generalSqrt(uint256 x) internal pure returns (uint128 z);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|value to calculate the square root of|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`z`|`uint128`|square root of the value|


### _optimalSqrt

Returns the square root of a given value using the Babylonian method.


```solidity
function _optimalSqrt(uint256 y) internal pure returns (uint256 z);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`y`|`uint256`|value to calculate the square root of|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`z`|`uint256`|square root of the value|


### _getLength

Returns the length of a given number.


```solidity
function _getLength(uint256 x) internal pure returns (uint256 length);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|number to calculate the length of|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`length`|`uint256`|length of the number|


## Errors
### LinFormula__InvalidInput

```solidity
error LinFormula__InvalidInput();
```

