# StdStorage
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/lib/forge-std/src/StdStorage.sol)


```solidity
struct StdStorage {
    mapping(address => mapping(bytes4 => mapping(bytes32 => FindData))) finds;
    bytes32[] _keys;
    bytes4 _sig;
    uint256 _depth;
    address _target;
    bytes32 _set;
    bool _enable_packed_slots;
    bytes _calldata;
}
```

