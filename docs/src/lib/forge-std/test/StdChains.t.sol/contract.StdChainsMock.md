# StdChainsMock
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/test/StdChains.t.sol)

**Inherits:**
[Test](/lib/forge-std/src/Test.sol/abstract.Test.md)


## Functions
### exposed_getChain


```solidity
function exposed_getChain(string memory chainAlias) public returns (Chain memory);
```

### exposed_getChain


```solidity
function exposed_getChain(uint256 chainId) public returns (Chain memory);
```

### exposed_setChain


```solidity
function exposed_setChain(string memory chainAlias, ChainData memory chainData) public;
```

### exposed_setFallbackToDefaultRpcUrls


```solidity
function exposed_setFallbackToDefaultRpcUrls(bool useDefault) public;
```

