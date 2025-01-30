> [!Warning]
> These contracts have not been audited and are not intended for production. Use at your own risk.

# Exponential Curve

## Overview

The **BancorFormula** contract provides an exponential curve-based model for token purchases and sales. It allows for the conversion between reserve tokens and main tokens using an exponential pricing model, where the price increases at an accelerating rate as the supply grows. This structure introduces more variability and growth potential compared to linear models, making it ideal for projects seeking higher initial pricing incentives with exponential growth potential.

### Changes Made to Bancor Formula
the **BancorFormula** contract includes several important changes to improve its functionality, readability, and overall structure. Below are the key modifications:

- **Changed Compiler to Solidity 0.8.28:** The contract is now compatible with Solidity 0.8.28, which includes built-in overflow protection, eliminating the need for SafeMath.
- **Changed to an Abstract Contract:** The contract is now abstract, allowing it to be extended or customized for specific use cases.
- **Removed Utils Import:** The contract no longer imports utility functions that were previously required.
- **Removed SafeMath Functions:** With Solidity 0.8's built-in overflow checks, the need for SafeMath has been removed for better performance and simplicity.
- **Removed Version Variable:** The version variable has been removed, as it is no longer necessary.
- **Removed `calculateCrossConnectorReturn()` Function:** This function was unnecessary for the current use case.
- **Removed `require` Statements in Favor of Custom Errors:** `require` statements have been replaced with custom errors to improve gas efficiency and error handling.
- **Added Comments for Clarity:** The contract has been thoroughly commented to improve code readability and understanding for developers.
- **Added Named Return Values:** Functions now include named return values for easier comprehension of their outputs.
- **Updated Some Parameter Names to be More Descriptive:** Certain parameter names have been updated to be more intuitive and easier to understand.
- **Added Leading `_` to Internal Function Names:** Internal functions now follow the common convention of adding an underscore (`_`) to their names for consistency and clarity.
- **Reordered Internal Functions:** Functions have been reordered to group `view` and `pure` functions together, improving code organization.

This contract is particularly suitable for projects that require dynamic, volatile token models, such as **DeFi tokens**, **volatile assets**, **crowdfunding**, and **NFTs**, where rapid and scalable price changes are necessary to reflect demand shifts and market volatility.

### Key Features
- **Exponential Price Curve:** The token price grows exponentially as more tokens are minted, encouraging early investment and rewarding long-term holders.
- **Increased Growth Potential:** As the supply increases, the price grows faster, offering more substantial returns for early adopters.
- **Dynamic Value:** Unlike linear models, the exponential curve allows for more complex pricing, ideal for projects with growing demand or limited token availability.
- **Scalability:** This model accommodates projects with fluctuating demand, where exponential price growth incentivizes both early participation and long-term investment.

### Use Cases for Exponential Curves
- **DeFi Tokens:** In decentralized finance (DeFi), token prices are often volatile due to changes in liquidity and market conditions. Exponential pricing helps reflect rapid price movements, rewarding early liquidity providers while enabling price growth that scales with demand.
- **Volatile Assets:** For assets that experience sharp increases in value, such as speculative tokens or commodities, exponential price curves ensure that token prices reflect market demand in real-time, adjusting quickly as more tokens are issued.
- **Crowdfunding or Token Sales:** Exponential pricing models can be used in token sales to attract early participants with lower prices while ensuring later buyers are priced higher as demand increases.
- **NFT Sales:** NFTs can be priced based on an exponential curve, with earlier tokens (or NFTs) being available at lower prices. As the supply of NFTs increases, the price rises exponentially, reflecting scarcity and demand.
- **Governance Tokens in DAOs:** Exponential pricing can incentivize participation in decentralized autonomous organizations (DAOs) by making governance tokens more expensive as more tokens are minted, aligning with growing demand and participation.

## How It Works

The **BancorFormula** contract calculates the cost of purchasing tokens or the return from selling tokens based on an exponential curve. As the supply of tokens grows, the price increases exponentially, which incentivizes early users to buy tokens at a lower price and ensures token value appreciates faster as the system matures.

### Key Concepts:
- **Exponential Growth:** Unlike linear pricing, where price increases at a steady rate, the exponential curve accelerates the price increase as more tokens are minted.
- **Reserve Ratio:** The reserve ratio determines how aggressively the price will increase, based on the growth rate of the supply.
- **Reserve Balance:** The reserve token is the underlying asset backing the price of the main token, providing stability to the exponential pricing model.
- **Supply:** The total number of tokens in circulation. As supply increases, the price rises exponentially based on the predefined curve.

By using this contract, you benefit from a flexible, high-growth pricing model that is ideal for projects with rapidly changing token economies or those seeking to encourage early participation while ensuring long-term token appreciation.

# Exponential Token Based Curve

## Overview

The **ExpTokenBasedFormula** contract combines the principles of the exponential curve with a token-based model, allowing users to buy whole, discreet tokens rather than converting a reserve amount into a fractional return. The price of each token increases exponentially based on the total supply and the reserve balance, encouraging early participation while creating predictable price growth.

This model is suitable for projects where users purchase whole tokens directly, such as **crowdfunding**, **staking pools**, **NFTs**, and **game economies**, where discreet token purchases are essential, and the exponential price increase is needed for incentivizing early investment.

### Key Features
- **Discrete Token Amounts:** Users can purchase specific amounts of tokens directly, with the price calculated based on the exponential relationship between the supply and reserve balance.
- **Exponential Price Curve:** As more tokens are minted, the price grows exponentially, offering greater rewards to early buyers.
- **Predictable Growth:** While the price increases exponentially, users can still anticipate the growth curve, which is beneficial for long-term planning.
- **Token-Based Purchase:** Users purchase tokens as discrete units, with the reserve token cost adjusted based on the number of tokens to be minted.

### Use Cases for Exponential Token-Based Curves
- **Crowdfunding or Token Sales:** In token sales, the price increases exponentially with each token purchased, offering early investors better rates and encouraging widespread participation in the project.
- **NFT Sales:** Each NFT, treated as a discrete token, can increase in value according to the exponential price curve. This creates a fair, predictable pricing structure for collectors, as the cost for subsequent NFTs increases exponentially as the supply grows.
- **Staking and Reward Systems:** Exponential pricing models can be used to reward early stakers and encourage participation over time, as the value of the staked tokens increases rapidly.
- **Game Assets:** In gaming economies where assets are bought and sold as discrete tokens, exponential price curves create a sense of urgency and reward early adoption by pricing assets at higher values as supply grows.

## How It Works

The **ExpTokenBasedFormula** contract calculates the price of tokens and their respective returns based on an exponential curve. Each user can purchase a specific number of tokens, and the price adjusts based on the supply and reserve balance, incentivizing early buyers by offering lower prices at the outset.

### Key Concepts:
- **Discrete Token Purchase:** Users select the number of tokens they wish to purchase, and the price is determined based on the exponential growth of the supply.
- **Exponential Growth:** The price per token increases exponentially as the total token supply increases, offering larger rewards to early investors.
- **Reserve Ratio:** The reserve ratio defines the rate at which the price increases, allowing for more control over the growth curve.
- **Reserve Balance:** The reserve balance is used to back the value of the main token, ensuring price stability in line with the exponential curve.
- **Supply:** As the total supply of tokens increases, the price grows exponentially, creating a fair and predictable model for token value appreciation.

By using this contract, you benefit from a high-growth, flexible token model that is ideal for projects where discrete token purchases and exponential growth patterns are desired, such as NFT sales and crowdfunding.

## License

This contract is licensed under the MIT License.

---
