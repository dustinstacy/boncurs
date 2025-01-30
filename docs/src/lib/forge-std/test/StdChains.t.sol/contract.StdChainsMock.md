# StdChainsMock
[Git Source](https://github.com/dustinstacy/boncurs/blob/8dd3d6e20d7e085dbf2dccdde2c14001616467cf/lib/forge-std/test/StdChains.t.sol)

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

