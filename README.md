# Boncurs Bonding Curve Library

[![License](https://img.shields.io/badge/License-MIT-brightgreen)](./#license)

[Overview](./#overview) • [Installation](./#installation) • [Usage](./#usage) • [Tools](./#tools) •  [License](./#license)

***

> \[!Warning] These contracts have not been audited and are not intended for production. Use at your own risk.

## Overview

**A smart contract bonding curve library.** For use with fungible and non-fungible token projects.

***

Current avaiable curves:

* Exponential
* Linear
* Exponential Token Based
* Linear Token Based
* Boncurs Curve

## Installation

#### Hardhat (npm)

```
$ npm install boncurs
```

#### Foundry (git)

```
$ forge install dustinstacy/boncurs
```

Add `@boncurs/contracts/=lib/boncurs/contracts/` in `remappings.txt.`

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
