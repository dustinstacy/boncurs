# stdError
[Git Source](https://github.com/dustinstacy/boncurs/blob/7928cae257b46ede89b50d06eaae18601fcd0340/lib/forge-std/src/StdError.sol)


## State Variables
### assertionError

```solidity
bytes public constant assertionError = abi.encodeWithSignature("Panic(uint256)", 0x01);
```


### arithmeticError

```solidity
bytes public constant arithmeticError = abi.encodeWithSignature("Panic(uint256)", 0x11);
```


### divisionError

```solidity
bytes public constant divisionError = abi.encodeWithSignature("Panic(uint256)", 0x12);
```


### enumConversionError

```solidity
bytes public constant enumConversionError = abi.encodeWithSignature("Panic(uint256)", 0x21);
```


### encodeStorageError

```solidity
bytes public constant encodeStorageError = abi.encodeWithSignature("Panic(uint256)", 0x22);
```


### popError

```solidity
bytes public constant popError = abi.encodeWithSignature("Panic(uint256)", 0x31);
```


### indexOOBError

```solidity
bytes public constant indexOOBError = abi.encodeWithSignature("Panic(uint256)", 0x32);
```


### memOverflowError

```solidity
bytes public constant memOverflowError = abi.encodeWithSignature("Panic(uint256)", 0x41);
```


### zeroVarError

```solidity
bytes public constant zeroVarError = abi.encodeWithSignature("Panic(uint256)", 0x51);
```


