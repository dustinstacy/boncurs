# Bar
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/lib/forge-std/test/StdCheats.t.sol)


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

