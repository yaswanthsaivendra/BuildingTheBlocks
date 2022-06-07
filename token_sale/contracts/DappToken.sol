pragma solidity ^0.5.0;

import "./erc20.sol";

contract DappToken {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;

    constructor(uint _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
}