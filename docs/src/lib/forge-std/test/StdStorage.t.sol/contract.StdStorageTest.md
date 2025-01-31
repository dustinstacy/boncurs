# StdStorageTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/lib/forge-std/test/StdStorage.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## State Variables
### test

```solidity
StorageTest internal test;
```


## Functions
### setUp


```solidity
function setUp() public;
```

### test_StorageHidden


```solidity
function test_StorageHidden() public;
```

### test_StorageObvious


```solidity
function test_StorageObvious() public;
```

### test_StorageExtraSload


```solidity
function test_StorageExtraSload() public;
```

### test_StorageCheckedWriteHidden


```solidity
function test_StorageCheckedWriteHidden() public;
```

### test_StorageCheckedWriteObvious


```solidity
function test_StorageCheckedWriteObvious() public;
```

### test_StorageCheckedWriteSignedIntegerHidden


```solidity
function test_StorageCheckedWriteSignedIntegerHidden() public;
```

### test_StorageCheckedWriteSignedIntegerObvious


```solidity
function test_StorageCheckedWriteSignedIntegerObvious() public;
```

### test_StorageMapStructA


```solidity
function test_StorageMapStructA() public;
```

### test_StorageMapStructB


```solidity
function test_StorageMapStructB() public;
```

### test_StorageDeepMap


```solidity
function test_StorageDeepMap() public;
```

### test_StorageCheckedWriteDeepMap


```solidity
function test_StorageCheckedWriteDeepMap() public;
```

### test_StorageDeepMapStructA


```solidity
function test_StorageDeepMapStructA() public;
```

### test_StorageDeepMapStructB


```solidity
function test_StorageDeepMapStructB() public;
```

### test_StorageCheckedWriteDeepMapStructA


```solidity
function test_StorageCheckedWriteDeepMapStructA() public;
```

### test_StorageCheckedWriteDeepMapStructB


```solidity
function test_StorageCheckedWriteDeepMapStructB() public;
```

### test_StorageCheckedWriteMapStructA


```solidity
function test_StorageCheckedWriteMapStructA() public;
```

### test_StorageCheckedWriteMapStructB


```solidity
function test_StorageCheckedWriteMapStructB() public;
```

### test_StorageStructA


```solidity
function test_StorageStructA() public;
```

### test_StorageStructB


```solidity
function test_StorageStructB() public;
```

### test_StorageCheckedWriteStructA


```solidity
function test_StorageCheckedWriteStructA() public;
```

### test_StorageCheckedWriteStructB


```solidity
function test_StorageCheckedWriteStructB() public;
```

### test_StorageMapAddrFound


```solidity
function test_StorageMapAddrFound() public;
```

### test_StorageMapAddrRoot


```solidity
function test_StorageMapAddrRoot() public;
```

### test_StorageMapUintFound


```solidity
function test_StorageMapUintFound() public;
```

### test_StorageCheckedWriteMapUint


```solidity
function test_StorageCheckedWriteMapUint() public;
```

### test_StorageCheckedWriteMapAddr


```solidity
function test_StorageCheckedWriteMapAddr() public;
```

### test_StorageCheckedWriteMapBool


```solidity
function test_StorageCheckedWriteMapBool() public;
```

### testFuzz_StorageCheckedWriteMapPacked


```solidity
function testFuzz_StorageCheckedWriteMapPacked(address addr, uint128 value) public;
```

### test_StorageCheckedWriteMapPackedFullSuccess


```solidity
function test_StorageCheckedWriteMapPackedFullSuccess() public;
```

### testFail_StorageConst


```solidity
function testFail_StorageConst() public;
```

### testFuzz_StorageNativePack


```solidity
function testFuzz_StorageNativePack(uint248 val1, uint248 val2, bool boolVal1, bool boolVal2) public;
```

### test_StorageReadBytes32


```solidity
function test_StorageReadBytes32() public;
```

### test_StorageReadBool_False


```solidity
function test_StorageReadBool_False() public;
```

### test_StorageReadBool_True


```solidity
function test_StorageReadBool_True() public;
```

### test_RevertIf_ReadingNonBoolValue


```solidity
function test_RevertIf_ReadingNonBoolValue() public;
```

### readNonBoolValue


```solidity
function readNonBoolValue() public;
```

### test_StorageReadAddress


```solidity
function test_StorageReadAddress() public;
```

### test_StorageReadUint


```solidity
function test_StorageReadUint() public;
```

### test_StorageReadInt


```solidity
function test_StorageReadInt() public;
```

### testFuzz_Packed


```solidity
function testFuzz_Packed(uint256 val, uint8 elemToGet) public;
```

### testFuzz_Packed2


```solidity
function testFuzz_Packed2(uint256 nvars, uint256 seed) public;
```

### testEdgeCaseArray


```solidity
function testEdgeCaseArray() public;
```

