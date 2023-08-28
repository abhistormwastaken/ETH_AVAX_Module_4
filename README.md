# ETH_AVAX_Module_4
# Project: Degen Token (ERC-20): Unlocking the Future of Gaming
The project is an ERC-20 token smart contract called "Degen" with additional functionalities to manage token balances, mint and burn tokens, and operate a simple store for redeeming items using tokens.

## Description

The project is an Ethereum-based decentralized application (DApp) that implements an ERC-20 token standard, referred to as "Degen." ERC-20 is a widely adopted standard for fungible tokens on the Ethereum blockchain. The "Degen" token contract adheres to this standard and provides various features for managing token balances and facilitating transactions between users.

The main components of the "Degen" token contract include:

* ERC-20 Implementation: The contract follows the ERC-20 interface, defining standard functions such as totalSupply(), balanceOf(), and transfer(). This allows users to check the total supply of tokens, view their own token balances, and transfer tokens to other addresses.

* Minting and Burning: The contract supports minting new tokens and burning existing ones. Minting allows the owner of the contract to create new tokens and increase the total supply, while burning tokens reduces the total supply. This allows for controlled token issuance and deflationary mechanisms.

* Owner Privileges: The contract has an owner address, set during deployment, who has special privileges through the onlyOwner modifier. The owner can execute specific functions restricted only to them, such as minting new tokens or adding items to the store.

* Token Transfer: Users can transfer tokens to other addresses using the transfer() function. Transfers are recorded in the contract events, enabling external observers to track token movements on the blockchain.

* Simple Store: The contract features a basic store functionality where the owner can add items with associated prices. Users can then redeem these items by paying the required amount of tokens. Upon redemption, the owner's balance increases, and the user receives the item.

### Executing program


To execute the program described in the previous code snippet, follow these steps:

Step 1: Deploy the Contract on the Avalanche Blockchain

* Use Remix or your preferred development environment to deploy the "AbhishekGame" contract on the Avalanche blockchain. Ensure that you have a connection to the Avalanche network and sufficient AVAX (Avalanche native token) in your account to cover the deployment fees.
  
Step 2: Set the Name and Symbol for the Token

* During contract deployment, provide the desired name and symbol for the "Degen" ERC-20 token. This information will be used to uniquely identify the token on the Avalanche blockchain.
* 
Step 3: Mint Initial Tokens

* After deploying the contract, use the mint function to mint and distribute initial tokens to specific addresses. As the contract owner, you can provide tokens to different users, contracts, or addresses to kickstart your project's economy.
* 
Step 4: Add Items to the In-Game Store

*As the contract owner, utilize the addItem function to add various in-game items to the store. Each item should have a unique ID, a name, and an associated price in "Degen" tokens. This allows players to redeem tokens for these in-game items.

Step 5: Token Functionality for Players

* Players can interact with the "Degen" contract in several ways:
* Transfer tokens to other players or addresses using the transfer function.
* Burn tokens (decrease their supply) using the burn function in certain game mechanics or scenarios.
* Redeem tokens to acquire in-game items from the store using the redeem function.
  
Step 6: View Available Items

* Implement the showItems function in your smart contract to allow players to view all available in-game items and their details. Players can query this function to get information about the available items they can redeem.
  
Step 7: Redeem Items

* Players can redeem in-game items by their unique item ID using the redeemItem function. When a player initiates a redemption, the corresponding number of "Degen" tokens will be deducted from their balance, and they will receive the redeemed item.
  
These steps outline the basic process for deploying and interacting with the "Degen" smart contract on the Avalanche blockchain for your in-game token economy. Make sure to properly test the contract and consider adding additional security measures to protect against potential vulnerabilities. Always deploy and interact with smart contracts carefully, especially on live networks.


## Authors
Abhishek Khanna

## License
This Contract is using the MIT License
