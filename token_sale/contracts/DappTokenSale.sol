pragma solidity ^0.5.0;


import "./DappToken.sol";
import "./safemath.sol";

contract DappTokenSale {

    using SafeMath for uint256;

    address payable admin;
    DappToken public tokenContract;
    uint public tokenPrice;
    uint public tokensSold;

    event Sell(address _buyer, uint _amount);

    constructor(DappToken _tokenContract,uint _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    // Buy Tokens
    function buyTokens(uint _numberOfTokens) public payable {
        require(msg.value == _numberOfTokens.mul(tokenPrice));
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));
        tokensSold = tokensSold.add(_numberOfTokens);
        emit Sell(msg.sender, _numberOfTokens);
    }

    //Ending sale
    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));
        selfdestruct(admin);
    }
}