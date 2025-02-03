# StdStorage
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/src/StdStorage.sol)


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

