> [!Warning]
> These contracts have not been audited and are not intended for production. Use at your own risk.

# Boncurs Curve

## Overview

The **Boncurs Formula** contract provides a custom pricing curve for token purchases and sales, designed to reward early adopters while protecting the value of tokens as the supply and reserve grow. The formula introduces an initial diminishing return on purchases, but once the reserve balance and token supply increase, the value becomes stable and can only increase over time. This makes it ideal for projects focused on long-term value creation, where early participants are incentivized but the value of the token cannot fall below a certain point.

### Key Features
- **Initial Diminishing Return:** The Boncurs Formula offers a temporary "hit" on token value during initial purchases, providing an incentive for early adoption. However, after this initial phase, the value of the token becomes stable and will only increase over time.
- **Stable Token Growth:** The value of the token can never decrease, ensuring long-term value for token holders. Once the initial "hit" is absorbed, the token's value increases steadily as more tokens are minted and the reserve balance grows.
- **Customizable Scaling Factor:** The scaling factor allows for customization of the token's price growth. By adjusting the scaling factor, developers can control how quickly the token price increases as the token supply grows.
- **Predictable Pricing:** With the Boncurs Formula, token purchasers can predict the future cost of tokens based on the current supply and reserve balance, making the token's pricing more transparent.

### Use Cases for Boncurs Curves
- **Crowdfunding & Token Sales:** The Boncurs Formula is ideal for token sales or fundraising events where early adopters are rewarded with a lower price, but the token value remains stable for later buyers. The temporary diminishing return incentivizes early participation without risking long-term devaluation. This makes the formula perfect for token sales where you want to create an incentive for early investors while ensuring the value of the token cannot drop later on.
- **Staking & Governance Tokens:** For projects focused on long-term engagement, such as governance or staking tokens, the Boncurs Formula ensures the token's value continues to rise over time, motivating holders to keep their tokens. This is especially useful for projects where tokens are used for staking, voting, or other long-term incentives, as it prevents value depreciation and encourages retention.
- **Community Engagement Tokens:** The formula is well-suited for community-driven projects where holding tokens over time provides value. This is ideal for membership-based systems, group incentives, or game economies where tokens are meant to be held and used rather than traded frequently. The Boncurs Formula incentivizes users to hold onto their tokens by preventing any potential decrease in value, thus fostering stronger engagement within the community.
- **Game Assets:** The Boncurs Formula is also useful for game economies where tokens are used as in-game assets. By ensuring the value of the token increases as more tokens are minted and the reserve grows, players are motivated to hold onto their tokens for longer periods, knowing the value will increase over time. This model helps create a sustainable in-game economy.
- **Early Adopter Reward Mechanisms:** The Boncurs Formula can be applied to reward early users of a platform or product. As the token's value starts lower, early participants will receive tokens at a discount, which they can hold or use as the value increases. This helps attract and retain early adopters while ensuring the long-term sustainability of the token’s value.

## How it Works

The Boncurs Formula calculates the price of tokens based on the supply and reserve balance, where each purchase contributes to the community reserve, slightly increasing the value of tokens held by previous owners. Once a user acquires a token, its value can only appreciate, as the token's worth is determined by a stable ratio between the total supply and the reserve, ensuring that the value doesn’t decrease even if someone sells their tokens.

## Key Concepts
- **Initial Investment Adjustment:** The Boncurs Formula introduces an initial "hit" to the value of tokens during the first few purchases. However, this is the only time the value of the token will decrease. After the initial adjustment period, the token price stabilizes and can only increase.
- **Scaling Factor:** This factor determines how quickly the token price increases as more tokens are minted. It gives developers flexibility to adjust the rate of price growth according to their project's needs.
- **Reserve Balance:** The reserve balance is the amount of reserve tokens (backing currency) that supports the value of the main token. It is used to calculate the cost of minting new tokens and the return for token sales.
- **Token Supply:** The total number of tokens in circulation. As the supply increases, the price of each token increases in a predictable manner, allowing users to anticipate future pricing.
- **Stable Growth:** Once the initial diminishing return is absorbed, the token's value can only increase over time, making it ideal for projects that encourage holding and long-term engagement.

## License

This contract is licensed under the MIT License.

---

By using this contract you provide a stable and transparent model for token pricing, making it ideal for projects that want to reward early adopters while ensuring that the token’s value can only increase over time. By using this contract, developers can create sustainable token economies where participants are incentivized to hold and engage with the project long-term.