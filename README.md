<h1 align="center">
Boncurs Bonding Curve Library
</h1>

<p align="center">
  <a href="https://www.npmjs.com/package/boncurs"><img src="https://img.shields.io/npm/v/boncurs"/></a>
  <a href="https://boncurs.gitbook.io/boncurs/"><img src="https://img.shields.io/static/v1?message=Documented%20on%20GitBook&logo=gitbook&logoColor=ffffff&label=%20&labelColor=5c5c5c&color=3F89A1"></a>
  <a href="./#license"><img src="https://img.shields.io/badge/License-MIT-brightgreen"/></a>
</p>


<p align="center">
  <a href="#overview">Overview</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#learn-more">Learn More</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#license">License</a> •
  <a href="https://boncurs.gitbook.io/boncurs/">Docs</a>
</p>

***

> [!WARNING]
> These contracts have not been audited and are not intended for production.
> Use at your own risk.

## Overview

**A smart contract bonding curve library.** For use with fungible and non-fungible token projects.

***

Current available curves:

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

Add `@boncurs/=lib/boncurs/` in `remappings.txt.`

## Usage

Once installed, you can use the contracts in the library by importing them:

```solidity
pragma solidity ^0.8.28;

import {BoncursCurve} from "boncurs/experimental/BoncursCurve.sol";

// Couple with a token contract for ideal use case
contract ExampleImplementation is BoncursCurve {
    // Track the scalingFactor, initialCost, supply, and reserverBalance using desired method
    uint32 private immutable i_scalingFactor;
    uint256 private immutable i_initialCost;
    uint256 private supply;
    uint256 private reserveBalance;

    function exampleFunc(uint256 amount) public returns (uint256 examplePurchaseReturn) {
        // Call library functions to use pricing calculations
        examplePurchaseReturn = getPurchaseCost(supply, reserveBalance, initialCost, scalingFactor, amount);
    }
}
```

## Learn More

Visit the documentation site: [Docs](https://boncurs.gitbook.io/boncurs)

Tools for working with the library: [Boncurs Bonding Curve Tools](https://github.com/dustinstacy/boncurs-tools)

## Contributing

Interested in contirbuting? Check out the current [issues](https://github.com/dustinstacy/boncurs/issues) or submit your own idea.

Follow these steps:

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License

The MIT License (MIT)
