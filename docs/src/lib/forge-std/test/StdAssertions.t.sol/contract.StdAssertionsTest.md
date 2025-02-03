# StdAssertionsTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/test/StdAssertions.t.sol)

**Inherits:**
[StdAssertions](/lib/forge-std/src/StdAssertions.sol/abstract.StdAssertions.md)


## State Variables
### errorMessage

```solidity
string constant errorMessage = "User provided message";
```


### maxDecimals

```solidity
uint256 constant maxDecimals = 77;
```


### SHOULD_REVERT

```solidity
bool constant SHOULD_REVERT = true;
```


### SHOULD_RETURN

```solidity
bool constant SHOULD_RETURN = false;
```


### STRICT_REVERT_DATA

```solidity
bool constant STRICT_REVERT_DATA = true;
```


### NON_STRICT_REVERT_DATA

```solidity
bool constant NON_STRICT_REVERT_DATA = false;
```


### vm

```solidity
VmInternal constant vm = VmInternal(address(uint160(uint256(keccak256("hevm cheat code")))));
```


## Functions
### testFuzz_AssertEqCall_Return_Pass


```solidity
function testFuzz_AssertEqCall_Return_Pass(
    bytes memory callDataA,
    bytes memory callDataB,
    bytes memory returnData,
    bool strictRevertData
) external;
```

### testFuzz_RevertWhenCalled_AssertEqCall_Return_Fail


```solidity
function testFuzz_RevertWhenCalled_AssertEqCall_Return_Fail(
    bytes memory callDataA,
    bytes memory callDataB,
    bytes memory returnDataA,
    bytes memory returnDataB,
    bool strictRevertData
) external;
```

### testFuzz_AssertEqCall_Revert_Pass


```solidity
function testFuzz_AssertEqCall_Revert_Pass(
    bytes memory callDataA,
    bytes memory callDataB,
    bytes memory revertDataA,
    bytes memory revertDataB
) external;
```

### testFuzz_RevertWhenCalled_AssertEqCall_Revert_Fail


```solidity
function testFuzz_RevertWhenCalled_AssertEqCall_Revert_Fail(
    bytes memory callDataA,
    bytes memory callDataB,
    bytes memory revertDataA,
    bytes memory revertDataB
) external;
```

### testFuzz_RevertWhenCalled_AssertEqCall_Fail


```solidity
function testFuzz_RevertWhenCalled_AssertEqCall_Fail(
    bytes memory callDataA,
    bytes memory callDataB,
    bytes memory returnDataA,
    bytes memory returnDataB,
    bool strictRevertData
) external;
```

### assertEqCallExternal


```solidity
function assertEqCallExternal(
    address targetA,
    bytes memory callDataA,
    address targetB,
    bytes memory callDataB,
    bool strictRevertData
) public;
```

### testFailFail


```solidity
function testFailFail() public;
```

