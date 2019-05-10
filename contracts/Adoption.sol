pragma solidity ^0.5.0;

contract Adoption {

	address[16] public adopters;
	address payable wallet;
	address owner;

	// Adopting a pet
	function adopt(uint petId) public returns (uint) {
	  require(petId >= 0 && petId <= 15);
	  adopters[petId] = msg.sender;
	  return petId;
	}

	// Retrieving the adopters
	function getAdopters() public view returns (address[16] memory) {
	  return adopters;
	}

	function transferEther() public payable {
		wallet.transfer(msg.value);
	}

	constructor (address payable _wallet) public {
		owner = msg.sender;
		wallet = _wallet;
	}

	

}