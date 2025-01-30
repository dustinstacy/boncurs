# Bar
[Git Source](https://github.com/dustinstacy/boncurs/blob/52a092a7ad60aeeee3132e910b32ca470eb8882d/lib/forge-std/test/StdCheats.t.sol)


## State Variables
### balanceOf
`DEAL` STDCHEAT


```solidity
mapping(address => uint256) public balanceOf;
```


### totalSupply

```solidity
uint256 public totalSupply;
```


## Functions
### constructor


```solidity
constructor() payable;
```

### bar

`DEAL` STDCHEAT
`HOAX` and `CHANGEPRANK` STDCHEATS


```solidity
function bar(address expectedSender) public payable;
```

### origin


```solidity
function origin(address expectedSender) public payable;
```

### origin


```solidity
function origin(address expectedSender, address expectedOrigin) public payable;
```

