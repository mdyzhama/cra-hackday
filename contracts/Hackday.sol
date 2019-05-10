pragma solidity 0.5.0;

contract Hackday {

  struct Item {
    uint id;
    string name;
    uint quantity;
    string picture;
    uint price;
  }
  
  // Read/write ItemsForSale
  mapping(uint => Item) public itemsForSale;

  struct User {
    uint id;
    string name;
    string picture;
    Item[] ownedItems;
  }

  mapping(uint => User) public users;

  function initializeItemsForSale () private {
    itemsForSale[1] = Item(1,"item-1", 3, "path-to-pic.png", 5);
    itemsForSale[2] = Item(2,"item-2", 2, "path-to-pic.png", 4);
    itemsForSale[3] = Item(3,"item-3", 4, "path-to-pic.png", 6);
  }

  function initializeUsers() private {
    users[1] = User(1, "Pierre", "path-to-pic.png", new Item[](0));
    users[2] = User(2, "Matt", "path-to-pic.png", new Item[](0));
    users[3] = User(3, "Shuoyi", "path-to-pic.png", new Item[](0));
    users[4] = User(4, "Jyothi", "path-to-pic.png", new Item[](0));
    users[5] = User(5, "Yi-Chi", "path-to-pic.png", new Item[](0));
  }

  function purchaseItem(uint itemId, uint quantity, uint userId) public {
    itemsForSale[itemId].quantity = itemsForSale[itemId].quantity - quantity;
    users[userId].ownedItems.push(Item(itemId, itemsForSale[itemId].name, quantity, itemsForSale[itemId].picture, itemsForSale[itemId].price));
  }

  function transactEther(uint originatingAccount, uint amount) private {

  }

  // Constructor
  constructor () public {
    initializeItemsForSale();
  }
}