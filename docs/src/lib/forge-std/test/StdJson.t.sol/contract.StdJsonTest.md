# StdJsonTest
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/test/StdJson.t.sol)

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

