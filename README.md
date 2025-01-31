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
* [Exponential](contracts/exponential/ExpCurve.sol) 
* [Linear](contracts/linear/LinCurve.sol) 
* [Exponential Token Based](contracts/exponential/ExpTokenBasedCurve.sol) 
* [Linear Token Based](contracts/linear/LinTokenBasedCurve.sol)
* [Boncurs Curve](contracts/experimental/BoncursCurve.sol)

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

## Planned Updates

#### Curve variety
* Logarithmic
* Sigmoidal
* Decaying

#### Tools
* User interface to visualize curves and pricing structure
* Wizard to implement desired curve into token contracts with presets including:
    * Fungible tokens
    * NFTs
    * Memberships
    * Governance tokens
    * Staking tokens
* No code contract deployer

#### Augmentations & Extensions
* Bonding curve inflection points
* Reserve balance burning/reallocating
* Protocol fees
* Upgradeability
* Treasury contract
* Vesting implementations

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License

The MIT License (MIT)
