# ERC721Recipient
[Git Source](https://github.com/dustinstacy/boncurs/blob/02ed8078bd89ba19394d69164a2bad75906f2c24/lib/forge-std/test/mocks/MockERC721.t.sol)

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

