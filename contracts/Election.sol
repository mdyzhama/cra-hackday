pragma solidity 0.5.0;

contract Election {

    struct ItemForSale {
        uint id;
        string name;
        uint quantity;
        string picture;
    }

    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/write Candidates
    mapping(uint => Candidate) public candidates;

    // Read/write ItemsForSale
    mapping(uint => ItemForSale) public itemsForSale;

    // Store Candidates Count
    uint public candidatesCount;

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function initializeItemsForSale () private {
        itemsForSale[1] = ItemForSale(1,"item-1", 3, "path-to-pic.png");
        itemsForSale[2] = ItemForSale(2,"item-2", 2, "path-to-pic.png");
        itemsForSale[3] = ItemForSale(3,"item-3", 4, "path-to-pic.png");
    }

    // Constructor
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
        initializeItemsForSale();
    }
}