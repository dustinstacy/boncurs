# IERC721Metadata
[Git Source](https://github.com/dustinstacy/boncurs/blob/52a092a7ad60aeeee3132e910b32ca470eb8882d/lib/forge-std/src/interfaces/IERC721.sol)

**Inherits:**
[IERC721](/lib/forge-std/src/interfaces/IERC721.sol/interface.IERC721.md)

*See https://eips.ethereum.org/EIPS/eip-721
Note: the ERC-165 identifier for this interface is 0x5b5e139f.*


## Functions
### name

A descriptive name for a collection of NFTs in this contract


```solidity
function name() external view returns (string memory _name);
```

### symbol

An abbreviated name for NFTs in this contract


```solidity
function symbol() external view returns (string memory _symbol);
```

### tokenURI

A distinct Uniform Resource Identifier (URI) for a given asset.

*Throws if `_tokenId` is not a valid NFT. URIs are defined in RFC
3986. The URI may point to a JSON file that conforms to the "ERC721
Metadata JSON Schema".*


```solidity
function tokenURI(uint256 _tokenId) external view returns (string memory);
```

