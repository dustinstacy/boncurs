# StdUtilsMock
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/lib/forge-std/test/StdUtils.t.sol)

**Inherits:**
[StdUtils](/lib/forge-std/src/StdUtils.sol/abstract.StdUtils.md)


## Functions
### exposed_getTokenBalances


```solidity
function exposed_getTokenBalances(address token, address[] memory addresses)
    external
    returns (uint256[] memory balances);
```

### exposed_bound


```solidity
function exposed_bound(int256 num, int256 min, int256 max) external pure returns (int256);
```

### exposed_bound


```solidity
function exposed_bound(uint256 num, uint256 min, uint256 max) external pure returns (uint256);
```

### exposed_bytesToUint


```solidity
function exposed_bytesToUint(bytes memory b) external pure returns (uint256);
```

