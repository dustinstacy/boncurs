# Boncurs Curve

> [!Warning]
> This contract has not been audited and is not intended for production. Use at your own risk.

## Overview

The **BoncursFormula** implements a custom token purchase and sale calculation based on a unique curve. It is designed to facilitate a token model where early adopters receive diminishing returns on their initial purchases, but the value of the token will never decrease over time. This model ensures that the token's value becomes more stable as the supply and reserve balance grow, rewarding long-term holders while not penalizing later participants.

This contract is ideal for applications where tokens are meant to be held and not traded frequently, such as **staking tokens**, **governance tokens**, **group membership tokens**, and **game assets**.

### Key Features
- **Initial Investment Adjustment:** Users will experience an initial reduction in the value of their token when purchasing, ensuring early holders take a "hit" on their investments. However, this is a one-time adjustment, and the token's value will never decrease once it stabilizes.
- **Uniform Token Value:** All tokens are worth the same amount, and their value will not be affected by individual buy/sell actions. This makes the token stable even during high volatility periods.
- **Encourages Holding:** The value of tokens increases as more tokens are minted and the reserve balance grows, incentivizing users to hold their tokens rather than frequently trading them.
- **Flat Curve for Late Adopters:** The formula gradually flattens over time, meaning that late adopters are not penalized. They can purchase tokens at a fair rate as the reserve balance stabilizes.

## License

This contract is licensed under the MIT License.

---
