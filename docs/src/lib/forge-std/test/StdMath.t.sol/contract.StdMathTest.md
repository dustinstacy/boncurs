# StdMathTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/test/StdMath.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## Functions
### test_GetAbs


```solidity
function test_GetAbs() external pure;
```

### testFuzz_GetAbs


```solidity
function testFuzz_GetAbs(int256 a) external pure;
```

### test_GetDelta_Uint


```solidity
function test_GetDelta_Uint() external pure;
```

### testFuzz_GetDelta_Uint


```solidity
function testFuzz_GetDelta_Uint(uint256 a, uint256 b) external pure;
```

### test_GetDelta_Int


```solidity
function test_GetDelta_Int() external pure;
```

### testFuzz_GetDelta_Int


```solidity
function testFuzz_GetDelta_Int(int256 a, int256 b) external pure;
```

### test_GetPercentDelta_Uint


```solidity
function test_GetPercentDelta_Uint() external;
```

### testFuzz_GetPercentDelta_Uint


```solidity
function testFuzz_GetPercentDelta_Uint(uint192 a, uint192 b) external pure;
```

### test_GetPercentDelta_Int


```solidity
function test_GetPercentDelta_Int() external;
```

### testFuzz_GetPercentDelta_Int


```solidity
function testFuzz_GetPercentDelta_Int(int192 a, int192 b) external pure;
```

### getAbs


```solidity
function getAbs(int256 a) private pure returns (uint256);
```

