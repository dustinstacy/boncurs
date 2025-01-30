# BancorFormula
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/contracts/exponential/BancorFormula.sol)

**Author:**
Bancor

Provides functions for calculating the purchase and sale return values on a linear curve using a scaling factor
This formula converts a given reserve token amount to a token amount and vice versa
This is an updated version of the BancorFormula contract from the Bancor Protocol
Editted to be compatible with Solidity 0.8.28
See README.md for detailed changes


## State Variables
### ONE

```solidity
uint256 private constant ONE = 1;
```


### MAX_RATIO

```solidity
uint32 private constant MAX_RATIO = 1000000;
```


### MIN_PRECISION

```solidity
uint8 private constant MIN_PRECISION = 32;
```


### MAX_PRECISION

```solidity
uint8 private constant MAX_PRECISION = 127;
```


### FIXED_1
*The following values are used for precision in the contract's fixed point arithmetic.*

*Powers of 2 are computationally efficient because shifting left or right by X is the same as multiplying or dividing by 2^X*


```solidity
uint256 private constant FIXED_1 = 0x080000000000000000000000000000000;
```


### FIXED_2

```solidity
uint256 private constant FIXED_2 = 0x100000000000000000000000000000000;
```


### MAX_NUM
*Value is capped to prevent overflow*


```solidity
uint256 private constant MAX_NUM = 0x200000000000000000000000000000000;
```


### LN2_NUMERATOR
*Used to convert from base 2 to natural logarithm*


```solidity
uint256 private constant LN2_NUMERATOR = 0x3f80fe03f80fe03f80fe03f80fe03f8;
```


### LN2_DENOMINATOR

```solidity
uint256 private constant LN2_DENOMINATOR = 0x5b9de1d10bf4103d647b0955897ba80;
```


### OPT_LOG_MAX_VAL
*Values that represent the point at which the optimal function approximations are still effective*


```solidity
uint256 private constant OPT_LOG_MAX_VAL = 0x15bf0a8b1457695355fb8ac404e7a79e3;
```


### OPT_EXP_MAX_VAL

```solidity
uint256 private constant OPT_EXP_MAX_VAL = 0x800000000000000000000000000000000;
```


### maxExpArray
*The array of values used to find the precision needed for the given input*


```solidity
uint256[128] private maxExpArray;
```


## Functions
### constructor

*Since maxExpArray is a fixed-size array, we need to initialize it in the constructor
To expand the array at the cost of higher gas fees, uncomment the following lines*


```solidity
constructor();
```

### _calculateBancorFormulaPurchaseReturn

*given a token supply, reserve balance, ratio and a deposit amount (in the reserve token),
calculates the return for a given conversion (in the main token)
Formula:
Return = supply * ((1 + depositAmount / reserveBalance) ^ (reserveRatio / 1000000) - 1)*


```solidity
function _calculateBancorFormulaPurchaseReturn(
    uint256 supply,
    uint256 reserveBalance,
    uint32 reserveRatio,
    uint256 depositAmount
) internal view returns (uint256 purchaseReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|           token total supply|
|`reserveBalance`|`uint256`|   total reserve balance|
|`reserveRatio`|`uint32`|     reserve ratio, represented in ppm, 1-1000000|
|`depositAmount`|`uint256`|    deposit amount, in reserve token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`purchaseReturn`|`uint256`|return amount|


### _calculateBancorFormulaSaleReturn

*given a token supply, reserve balance, ratio and a sell amount (in the main token),
calculates the return for a given conversion (in the reserve token)
Formula:
Return = reserveBalance * (1 - (1 - sellAmount / supply) ^ (1 / (reserveRatio / 1000000)))*


```solidity
function _calculateBancorFormulaSaleReturn(
    uint256 supply,
    uint256 reserveBalance,
    uint32 reserveRatio,
    uint256 sellAmount
) internal view returns (uint256 saleReturn);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`supply`|`uint256`|           token total supply|
|`reserveBalance`|`uint256`|   total reserve|
|`reserveRatio`|`uint32`|     constant reserve Ratio, represented in ppm, 1-1000000|
|`sellAmount`|`uint256`|       sell amount, in the token itself|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`saleReturn`|`uint256`|return amount|


### _power

General Description:
Determine a value of precision.
Calculate an integer approximation of (baseN / baseD) ^ (expN / expD) * 2 ^ precision.
Return the result along with the precision used.
Detailed Description:
Instead of calculating "base ^ exp", we calculate "e ^ (log(base) * exp)".
The value of "log(base)" is represented with an integer slightly smaller than "log(base) * 2 ^ precision".
The larger "precision" is, the more accurately this value represents the real value.
However, the larger "precision" is, the more bits are required in order to store this value.
And the exponentiation function, which takes "x" and calculates "e ^ x", is limited to a maximum exponent (maximum value of "x").
This maximum exponent depends on the "precision" used, and it is given by "maxExpArray[precision] >> (MAX_PRECISION - precision)".
Hence we need to determine the highest precision which can be used for the given input, before calling the exponentiation function.
This allows us to compute "base ^ exp" with maximum accuracy and without exceeding 256 bits in any of the intermediate computations.
This functions assumes that "expN < 2 ^ 256 / log(MAX_NUM - 1)", otherwise the multiplication should be replaced with a "safeMul".


```solidity
function _power(uint256 baseN, uint256 baseD, uint32 expN, uint32 expD)
    internal
    view
    returns (uint256 result, uint8 precision);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`baseN`|`uint256`|       base numerator|
|`baseD`|`uint256`|       base denominator|
|`expN`|`uint32`|        exponent numerator|
|`expD`|`uint32`|        exponent denominator|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`uint256`|      exponentiation result|
|`precision`|`uint8`|   precision used|


### _findPositionInMaxExpArray

The global "maxExpArray" is sorted in descending order, and therefore the following statements are equivalent:
- This function finds the position of [the smallest value in "maxExpArray" larger than or equal to "x"]
- This function finds the highest position of [a value in "maxExpArray" larger than or equal to "x"]


```solidity
function _findPositionInMaxExpArray(uint256 x) internal view returns (uint8 position);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|          input|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`position`|`uint8`|   position of the value in the array|


### _generalLog

Compute log(x / FIXED_1) * FIXED_1.
This functions assumes that "x >= FIXED_1", because the output would be negative otherwise.


```solidity
function _generalLog(uint256 x) internal pure returns (uint256 result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|        input|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`uint256`|  logarithm of x|


### _floorLog2

Compute the largest integer smaller than or equal to the binary logarithm of the input.


```solidity
function _floorLog2(uint256 x) internal pure returns (uint8 result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|      input|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`uint8`| result|


### _generalExp

This function can be auto-generated by the script 'PrintFunctionGeneralExp.py'.
It approximates "e ^ x" via maclaurin summation: "(x^0)/0! + (x^1)/1! + ... + (x^n)/n!".
It returns "e ^ (x / 2 ^ precision) * 2 ^ precision", that is, the result is upshifted for accuracy.
The global "maxExpArray" maps each "precision" to "((maximumExponent + 1) << (MAX_PRECISION - precision)) - 1".
The maximum permitted value for "x" is therefore given by "maxExpArray[precision] >> (MAX_PRECISION - precision)".


```solidity
function _generalExp(uint256 x, uint8 precision) internal pure returns (uint256 result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|          input|
|`precision`|`uint8`|  precision|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`uint256`|     result|


### _optimalLog

Return log(x / FIXED_1) * FIXED_1
Input range: FIXED_1 <= x <= OPT_LOG_MAX_VAL - 1
Auto-generated via 'PrintFunctionOptimalLog.py'
Detailed description:
- Rewrite the input as a product of natural exponents and a single residual r, such that 1 < r < 2
- The natural logarithm of each (pre-calculated) exponent is the degree of the exponent
- The natural logarithm of r is calculated via Taylor series for log(1 + x), where x = r - 1
- The natural logarithm of the input is calculated by summing up the intermediate results above
- For example: log(250) = log(e^4 * e^1 * e^0.5 * 1.021692859) = 4 + 1 + 0.5 + log(1 + 0.021692859)


```solidity
function _optimalLog(uint256 x) internal pure returns (uint256 result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|        input|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`uint256`|  result|


### _optimalExp

Return e ^ (x / FIXED_1) * FIXED_1
Input range: 0 <= x <= OPT_EXP_MAX_VAL - 1
Auto-generated via 'PrintFunctionOptimalExp.py'
Detailed description:
- Rewrite the input as a sum of binary exponents and a single residual r, as small as possible
- The exponentiation of each binary exponent is given (pre-calculated)
- The exponentiation of r is calculated via Taylor series for e^x, where x = r
- The exponentiation of the input is calculated by multiplying the intermediate results above
- For example: e^5.021692859 = e^(4 + 1 + 0.5 + 0.021692859) = e^4 * e^1 * e^0.5 * e^0.021692859


```solidity
function _optimalExp(uint256 x) internal pure returns (uint256 result);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`x`|`uint256`|        input|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`result`|`uint256`|  result|


## Errors
### BancorFormula__InvalidInput

```solidity
error BancorFormula__InvalidInput();
```

