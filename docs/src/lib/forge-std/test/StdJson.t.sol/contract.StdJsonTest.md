# StdJsonTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/lib/forge-std/test/StdJson.t.sol)

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

### test_readJson


```solidity
function test_readJson() public view;
```

### test_writeJson


```solidity
function test_writeJson() public;
```

## Structs
### SimpleJson

```solidity
struct SimpleJson {
    uint256 a;
    string b;
}
```

### NestedJson

```solidity
struct NestedJson {
    uint256 a;
    string b;
    SimpleJson c;
}
```

