pragma solidity ^0.4.0;

contract SimpleCoin {
    
    mapping (address => uint256) public coinBalance;
    
    constructor() public {
        
        coinBalance[0x92064096774F47D5a11516123753FF29F0e4Dc1b] = 10000;
        
    }
    
    function transfer (address _to, uint256 _amount) public {
    coinBalance[msg.sender] -= _amount;
    coinBalance[_to] += _amount;
        
    }
}