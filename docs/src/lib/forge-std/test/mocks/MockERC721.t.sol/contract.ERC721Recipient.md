# ERC721Recipient
[Git Source](https://github.com/dustinstacy/boncurs/blob/52a092a7ad60aeeee3132e910b32ca470eb8882d/lib/forge-std/test/mocks/MockERC721.t.sol)

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

