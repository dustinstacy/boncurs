# StdUtilsTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/test/StdUtils.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## Functions
### test_Bound


```solidity
function test_Bound() public pure;
```

### test_Bound_WithinRange


```solidity
function test_Bound_WithinRange() public pure;
```

### test_Bound_EdgeCoverage


```solidity
function test_Bound_EdgeCoverage() public pure;
```

### testFuzz_Bound_DistributionIsEven


```solidity
function testFuzz_Bound_DistributionIsEven(uint256 min, uint256 size) public pure;
```

### testFuzz_Bound


```solidity
function testFuzz_Bound(uint256 num, uint256 min, uint256 max) public pure;
```

### test_BoundUint256Max


```solidity
function test_BoundUint256Max() public pure;
```

### test_RevertIf_BoundMaxLessThanMin


```solidity
function test_RevertIf_BoundMaxLessThanMin() public;
```

### testFuzz_RevertIf_BoundMaxLessThanMin


```solidity
function testFuzz_RevertIf_BoundMaxLessThanMin(uint256 num, uint256 min, uint256 max) public;
```

### test_BoundInt


```solidity
function test_BoundInt() public pure;
```

### test_BoundInt_WithinRange


```solidity
function test_BoundInt_WithinRange() public pure;
```

### test_BoundInt_EdgeCoverage


```solidity
function test_BoundInt_EdgeCoverage() public pure;
```

### testFuzz_BoundInt_DistributionIsEven


```solidity
function testFuzz_BoundInt_DistributionIsEven(int256 min, uint256 size) public pure;
```

### testFuzz_BoundInt


```solidity
function testFuzz_BoundInt(int256 num, int256 min, int256 max) public pure;
```

### test_BoundIntInt256Max


```solidity
function test_BoundIntInt256Max() public pure;
```

### test_BoundIntInt256Min


```solidity
function test_BoundIntInt256Min() public pure;
```

### test_RevertIf_BoundIntMaxLessThanMin


```solidity
function test_RevertIf_BoundIntMaxLessThanMin() public;
```

### testFuzz_RevertIf_BoundIntMaxLessThanMin


```solidity
function testFuzz_RevertIf_BoundIntMaxLessThanMin(int256 num, int256 min, int256 max) public;
```

### test_BoundPrivateKey


```solidity
function test_BoundPrivateKey() public pure;
```

### test_BytesToUint


```solidity
function test_BytesToUint() external pure;
```

### test_RevertIf_BytesLengthExceeds32


```solidity
function test_RevertIf_BytesLengthExceeds32() external;
```

### test_ComputeCreateAddress


```solidity
function test_ComputeCreateAddress() external pure;
```

### test_ComputeCreate2Address


```solidity
function test_ComputeCreate2Address() external pure;
```

### test_ComputeCreate2AddressWithDefaultDeployer


```solidity
function test_ComputeCreate2AddressWithDefaultDeployer() external pure;
```

