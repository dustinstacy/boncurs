> [!Warning]
> These contracts have not been audited and are not intended for production. Use at your own risk.

# Linear Curve

## Overview

The **LinFormula** contract provides a linear curve-based model for token purchases and sales. It allows for a straightforward conversion between reserve tokens and a main token using a scaling factor, and it operates under a linear pricing model. This simple structure ensures predictability in the price of tokens, making it ideal for use cases where transparency and simplicity are key priorities.

This contract is suitable for projects that need a stable token model with a consistent, linear relationship between the reserve token and the main token's value, including **crowdfunding**, **staking pools**, and **game economies** where a linear growth pattern is desired.

### Key Features
- **Linear Price Curve:** The token price increases linearly as more tokens are minted. This provides predictable and transparent pricing for users.
- **Stable Value:** Unlike more complex models with diminishing returns or volatile price fluctuations, the linear model ensures that the price of tokens grows at a constant rate.
- **Simplicity and Transparency:** With a linear curve, users can easily understand how much they need to invest to purchase a specific number of tokens, and vice versa. There are no complicated formulas or sudden shifts in pricing.

### Use Cases for Linear Curves
- **Crowdfunding or Token Sales:** Linear curves are often used in token sales or ICOs where the price increases gradually with each token purchased. This ensures that early backers are not punished with extremely high prices while still incentivizing early participation.
- **Staking and Reward Systems:** Linear curves can be used to calculate rewards for staking, where the value of tokens increases steadily over time as more users participate.
- **Game Assets:** In game economies where items or assets need to be bought and sold at a predictable rate, a linear pricing model allows for a balanced experience for all players, regardless of when they join the game.
- **Governance Tokens:** For governance tokens in decentralized autonomous organizations (DAOs), linear price increases help keep the token's price stable and incentivize users to hold rather than frequently trade.

## How It Works

The **LinFormula** contract provides a straightforward method for calculating the amount of tokens a user can purchase or sell based on the reserve balance and scaling factor. The price of each token increases linearly as the total supply grows, ensuring that the relationship between the reserve balance and token supply remains consistent and predictable.

### Key Concepts:
- **Scaling Factor:** This factor adjusts the price of each token as the supply increases. It determines the rate at which the token price grows.
- **Initial Cost:** The starting price of the token, which can be customized according to the project's needs.
- **Reserve Balance:** The balance of the reserve token that is used to back the value of the main token.
- **Supply:** The total number of tokens in circulation. As the supply increases, the price of each token increases linearly.

By using this contract, you benefit from a transparent, predictable token model that is ideal for simple token economies, staking systems, and predictable crowdfunding models. It is particularly well-suited for use cases where consistent, gradual price increases are desired over time.

# Linear Token Based Curve

## Overview

The **LinTokenBasedFormula** contract combines the principles of the linear curve with a token-based model, allowing users to buy whole, discreet tokens rather than converting a reserve amount into a fractional return. The price of each token increases linearly based on the total supply and the reserve balance, encouraging early participation while creating predictable price growth.

This model is suitable for projects where users purchase whole tokens directly, such as **crowdfunding**, **staking pools**, **NFTs**, and **game economies**, where discreet token purchases are essential, and the linear price predicatability is ideal.

### Key Features
- **Discrete Token Amounts:** Users can purchase specific amounts of tokens directly, and the price adjusts based on the total supply and the reserve balance.
- **Linear Price Curve:** The token price increases linearly as more tokens are minted. This provides predictable and transparent pricing for users.
- **Stable Value:** Unlike more complex models with diminishing returns or volatile price fluctuations, the linear model ensures that the price of tokens grows at a constant rate.
- **Simplicity and Transparency:** With a linear curve, users can easily understand how much they need to invest to purchase a specific number of whole tokens, and vice versa. There are no complicated formulas or sudden shifts in pricing.

### Use Cases for Linear Curves
- **Crowdfunding or Token Sales:** Linear curves are often used in token sales or ICOs where the price increases gradually with each token purchased. This ensures that early backers are not punished with extremely high prices while still incentivizing early participation.
- **Staking and Reward Systems:** Linear curves can be used to calculate rewards for staking, where the value of tokens increases steadily over time as more users participate.
- **Game Assets:** In game economies where items or assets need to be bought and sold at a predictable rate, a linear pricing model allows for a balanced experience for all players, regardless of when they join the game.
- **NFT Sales** Each NFT can be treated as a discrete token with its own price determined by the reserve and supply dynamics. As more NFTs are minted and purchased, the price of subsequent NFTs can increase according to a scalable model, creating a fair and predictable pricing structure for collectors and investors.

## How It Works

The **LinTokenBasedFormula** contract calculates the price of tokens and their respective returns based on an linear curve. Each user can purchase and sell a specific number of tokens, and the price of each token increases linearly as the total supply grows, ensuring that the relationship between the reserve balance and token supply remains consistent and predictable.

### Key Concepts:
- **Discrete Token Purchase:** Users select the exact number of tokens they wish to buy, and the price is calculated based on the scaling factor and supply.
- **Scaling Factor:** This factor adjusts the price of each token as the supply increases. It determines the rate at which the token price grows.
- **Initial Cost:** The starting price of the token, which can be customized according to the project's needs.
- **Reserve Balance:** The balance of the reserve token that is used to back the value of the main token.
- **Supply:** The total number of tokens in circulation. As the supply increases, the price of each token increases linearly.

By using this contract, you benefit from a transparent, predictable token model that is ideal for simple token economies, staking systems, predictable crowdfunding models, and NFTs. It is particularly well-suited for use cases where consistent, gradual price increases and discreet token amounts are desirable.

## License

This contract is licensed under the MIT License.

---

