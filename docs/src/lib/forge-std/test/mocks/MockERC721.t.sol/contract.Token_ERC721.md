# Token_ERC721
[Git Source](https://github.com/dustinstacy/boncurs/blob/6c025f69156de715812d7a6a70f223cf6541ed15/lib/forge-std/test/mocks/MockERC721.t.sol)

**Inherits:**
[MockERC721](/lib/forge-std/src/mocks/MockERC721.sol/contract.MockERC721.md)


## Functions
### constructor


```solidity
constructor(string memory _name, string memory _symbol);
```

### tokenURI


```solidity
function tokenURI(uint256) public pure virtual override returns (string memory);
```

### mint


```solidity
function mint(address to, uint256 tokenId) public virtual;
```

### burn


```solidity
function burn(uint256 tokenId) public virtual;
```

### safeMint


```solidity
function safeMint(address to, uint256 tokenId) public virtual;
```

### safeMint


```solidity
function safeMint(address to, uint256 tokenId, bytes memory data) public virtual;
```

