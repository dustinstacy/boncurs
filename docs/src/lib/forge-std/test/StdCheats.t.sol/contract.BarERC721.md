# BarERC721
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/test/StdCheats.t.sol)


## State Variables
### _owners

```solidity
mapping(uint256 => address) private _owners;
```


### _balances

```solidity
mapping(address => uint256) private _balances;
```


## Functions
### constructor


```solidity
constructor() payable;
```

### balanceOf

`DEALERC721` STDCHEAT


```solidity
function balanceOf(address owner) public view virtual returns (uint256);
```

### ownerOf


```solidity
function ownerOf(uint256 tokenId) public view virtual returns (address);
```

