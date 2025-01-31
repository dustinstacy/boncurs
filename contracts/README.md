<h1 align="center">
Boncurs Bonding Curve Library
</h1>

<p align="center">
   <a href="#license">
    <img src="https://img.shields.io/badge/License-MIT-brightgreen" alt="License">
  </a>
</p>

<p align="center">
  <a href="#overview">Overview</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#tools">Tools</a> •
  <a href="#planned-updates">Planned Updates</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#license">License</a>
</p>

---

> [!Warning]
> These contracts have not been audited and are not intended for production. Use at your own risk.

## Overview

**A smart contract bonding curve library.** For use with fungible and non-fungible token projects.

---

Current avaiable curves: 
* [Exponential](exponential/ExpCurve.sol) 
* [Linear](linear/LinCurve.sol) 
* [Exponential Token Based](exponential/ExpTokenBasedCurve.sol) 
* [Linear Token Based](linear/LinTokenBasedCurve.sol)
* [Boncurs Curve](experimental/BoncursCurve.sol)

## Installation

```
$ npm install boncurs
```

## Usage

Once installed, you can use the contracts in the library by importing them:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ExpCurve} from "@boncurs/contracts/exponential/ExpCurve.sol";

// Couple with a token contract for ideal use case
contract ExampleImplementation is ExpCurve {
    // Track the reserve ratio, reserve balance, and supply using desired method
    uint32 private reserveRatio;
    uint256 private reserveBalance;
    uint256 private supply;

    function exampleFunc(uint256 depositAmount) public {
        // Call library methods to use pricing calculations
        uint256 examplePurchaseReturn = getPurchaseReturn(supply, reserveBalance, reserveRatio, depositAmount);
    }
}
```

## Tools

[Boncurs Bonding Curve Tools](https://github.com/dustinstacy/boncurs-tools)

## License

The MIT License (MIT)
