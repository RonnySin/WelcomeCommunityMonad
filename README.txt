WelcomeCommunity Smart Contract
Welcome to the WelcomeCommunity smart contract — a simple yet elegant on-chain utility that tracks and celebrates user interaction within a Web3 community. Designed for the Monad Community, this contract encourages engagement and rewards loyalty with personalized messages.

Overview
The WelcomeCommunity contract is built on Solidity ^0.8.20 and provides:

A warm, programmable welcome message.

A history of user interactions.

A basic incentive mechanism to acknowledge loyal community members.

Contract Features
welcome()
Emits an interaction event every time it's called.

Returns: "Welcome to the Monad Community!"

checkHistory()
Returns a customized string based on the number of interactions.

Over 100: Thanks the user for their loyalty.

Otherwise: Encourages continued engagement.

interactions (mapping)
Publicly viewable record of how many times each address has interacted with the contract.

How It Works
The core logic is centered around a modifier called trackInteraction, which:

Increments the interaction count for msg.sender.

Emits an Interaction event with the updated count.

Wraps around any function (currently welcome) to track user engagement seamlessly.

Smart Contract Details
Solidity Version: ^0.8.20

License: MIT

Compiler Optimized: Yes (recommend enabling optimizer for deployment)

Use Cases
Community onboarding

Gamified dApps

Loyalty and reputation systems

Engagement metrics dashboards

Getting Started
Deployment
bash
Copy
Edit
# using Hardhat or Remix
npx hardhat compile
npx hardhat deploy --network <your_network>
Interaction
Call welcome() to interact with the contract and record your presence.

Example (using ethers.js):

javascript
Copy
Edit
await contract.welcome();
const message = await contract.checkHistory();
console.log(message);
Future Enhancements (Ideas)
NFT rewards based on milestones (e.g., 50 or 100 interactions).

Integration with a front-end leaderboard.

Decentralized reputation score across multiple dApps.
