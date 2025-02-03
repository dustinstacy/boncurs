# BarERC1155
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/test/StdCheats.t.sol)


## State Variables
### _balances
`DEALERC1155` STDCHEAT


```solidity
mapping(uint256 => mapping(address => uint256)) private _balances;
```


### _totalSupply

```solidity
mapping(uint256 => uint256) private _totalSupply;
```


## Functions
### constructor


```solidity
constructor() payable;
```

### balanceOf

`DEALERC1155` STDCHEAT


```solidity
function balanceOf(address account, uint256 id) public view virtual returns (uint256);
```

### totalSupply


```solidity
function totalSupply(uint256 id) public view virtual returns (uint256);
```

