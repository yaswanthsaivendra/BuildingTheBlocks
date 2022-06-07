pragma solidity ^0.5.0;

import "./erc20.sol";

contract DappToken {
    uint public totalSupply;
    string public name="DApp Token";
    string public symbol="DAPP";
    string public standard="DApp Token 1.0";

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );


    mapping(address => uint) public balanceOf;

    constructor(uint _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(_value <= balanceOf[msg.sender]);
        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balanceOf[_to] + _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

}