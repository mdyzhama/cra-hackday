pragma solidity >=0.4.22 <0.6.0;
contract MyContract {
    mapping(address => uint256) public balances;
    address payable wallet;
    
    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function() external payable {
        buyToken();
    }

    function buyToken() public payable {
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
