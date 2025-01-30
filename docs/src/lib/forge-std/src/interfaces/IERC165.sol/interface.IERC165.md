# IERC165
[Git Source](https://github.com/dustinstacy/boncurs/blob/8dd3d6e20d7e085dbf2dccdde2c14001616467cf/lib/forge-std/src/interfaces/IERC165.sol)


## Functions
### supportsInterface

Query if a contract implements an interface

*Interface identification is specified in ERC-165. This function
uses less than 30,000 gas.*


```solidity
function supportsInterface(bytes4 interfaceID) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`interfaceID`|`bytes4`|The interface identifier, as specified in ERC-165|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|`true` if the contract implements `interfaceID` and `interfaceID` is not 0xffffffff, `false` otherwise|


