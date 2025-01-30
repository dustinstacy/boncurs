# ERC721Recipient
[Git Source](https://github.com/dustinstacy/boncurs/blob/8dd3d6e20d7e085dbf2dccdde2c14001616467cf/lib/forge-std/test/mocks/MockERC721.t.sol)

**Inherits:**
[IERC721TokenReceiver](/lib/forge-std/src/interfaces/IERC721.sol/interface.IERC721TokenReceiver.md)


## State Variables
### operator

```solidity
address public operator;
```


### from

```solidity
address public from;
```


### id

```solidity
uint256 public id;
```


### data

```solidity
bytes public data;
```


## Functions
### onERC721Received


```solidity
function onERC721Received(address _operator, address _from, uint256 _id, bytes calldata _data)
    public
    virtual
    override
    returns (bytes4);
```

