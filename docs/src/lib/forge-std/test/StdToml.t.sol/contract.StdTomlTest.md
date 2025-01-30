# StdTomlTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/lib/forge-std/test/StdToml.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## State Variables
### root

```solidity
string root;
```


### path

```solidity
string path;
```


## Functions
### setUp


```solidity
function setUp() public;
```

### test_readToml


```solidity
function test_readToml() public view;
```

### test_writeToml


```solidity
function test_writeToml() public;
```

## Structs
### SimpleToml

```solidity
struct SimpleToml {
    uint256 a;
    string b;
}
```

### NestedToml

```solidity
struct NestedToml {
    uint256 a;
    string b;
    SimpleToml c;
}
```

