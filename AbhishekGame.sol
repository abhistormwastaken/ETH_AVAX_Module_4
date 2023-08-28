// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Interface for ERC20 token standard
interface IERC20 {
    function total_supply() external view returns (uint);
    function balance_of(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    
    // Event to be emitted when a transfer occurs
    event Transfer(address indexed from, address indexed to, uint amount);
}

// ERC20 token contract that implements the IERC20 interface
contract ERC20 is IERC20 {
    // Immutable variable to store the contract token_owner's address
    address public immutable token_owner;

    // Total supply of the ERC20 token
    uint public total_supply;

    // Mapping to store the balance of each address
    mapping (address => uint) public balance_of;

    // Struct to represent an item
    struct Item {
        uint itemId;
        string itemName;
        uint itemPrice;
    }
    
    // Mapping to store the items by their IDs
    mapping(uint => Item) public items;
    
    // Variable to keep track of the number of items
    uint public items_Count;

    // Constructor that initializes the contract and sets the token_owner as the deployer of the contract
    constructor() {
        token_owner = msg.sender;
        total_supply = 0;
    }

    // Modifier to restrict access to certain functions only to the contract token_owner
    modifier onlytoken_owner {
        require(msg.sender == token_owner, "Only the contract token_owner can execute this function");
        _;
    }

    // Public constant variables to store the name, symbol, and decimals of the ERC20 token
    string public constant name = "Degen";
    string public constant symbol = "DGN";
    uint8 public constant decimals = 0;

    // Function to transfer tokens from the sender to a recipient
    function transfer(address recipient, uint amount) external returns (bool) {
        // Check if the sender has sufficient balance to make the transfer
        require(balance_of[msg.sender] >= amount, "The balance is insufficient");

        // Deduct the transferred amount from the sender's balance and add it to the recipient's balance
        balance_of[msg.sender] -= amount;
        balance_of[recipient] += amount;

        // Emit a Transfer event to log the transfer
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // Function to mint new tokens (increase total supply) - can only be called by the token_owner
    function mint(address receiver, uint amount) external onlytoken_owner {
        // Increase the balance of the receiver and total supply by the specified amount
        balance_of[receiver] += amount;
        total_supply += amount;

        // Emit a Transfer event to log the minting
        emit Transfer(address(0), receiver, amount);
    }

    // Function to burn tokens (decrease total supply)
    function burn(uint amount) external {
        // Check if the amount to burn is greater than zero and the sender has sufficient balance
        require(amount > 0, "Amount should not be zero");
        require(balance_of[msg.sender] >= amount, "The balance is insufficient");

        // Deduct the burned amount from the sender's balance and total supply
        balance_of[msg.sender] -= amount;
        total_supply -= amount;

        // Emit a Transfer event to log the burning
        emit Transfer(msg.sender, address(0), amount);
    }
    
    // Function to add an item to the store - can only be called by the token_owner
    function addItem(string memory itemName, uint256 itemPrice) external onlytoken_owner {
        // Increment the items_Count to create a new item ID
        items_Count++;

        // Create a new Item and store it in the items mapping
        Item memory newItem = Item(items_Count, itemName, itemPrice);
        items[items_Count] = newItem;
    }

    // Function to get all the items in the store
    function getItems() external view returns (Item[] memory) {
        // Create a new dynamic array to hold all the items
        Item[] memory allItems = new Item[](items_Count);
        
        // Iterate through all items and add them to the array
        for (uint i = 1; i <= items_Count; i++) {
            allItems[i - 1] = items[i];
        }
        
        // Return the array of items
        return allItems;
    }
    
    // Function to redeem an item from the store
    function redeem(uint itemId) external {
        // Check if the provided item ID is valid
        require(itemId > 0 && itemId <= items_Count, "Invalid item ID");
        
        // Retrieve the item based on the provided ID
        Item memory redeemedItem = items[itemId];
        
        // Check if the sender has sufficient balance to redeem the item
        require(balance_of[msg.sender] >= redeemedItem.itemPrice, "Insufficient balance to redeem");
        
        // Deduct the item price from the sender's balance and add it to the token_owner's balance
        balance_of[msg.sender] -= redeemedItem.itemPrice;
        balance_of[token_owner] += redeemedItem.itemPrice;
        
        // Emit a Transfer event to log the redemption
        emit Transfer(msg.sender, address(0), redeemedItem.itemPrice);
    }
}
