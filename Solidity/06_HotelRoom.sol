// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

    /*
    working with ether
    enums
    modifiers
    events
    */
contract HotelRoom {

    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;

    //Events are a way for your contract to communicate that something happened on the blockchain to our app front-end, which can be 'listening' for certain events and take action when they happen.
    // declare the event
    event Occupy(address _occupant, uint _value);


    address payable public owner;   //payable modifier can be used on a function or state variable to ensure that it can send and recieve ether.

    constructor() public {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant {
        //require ensures that certain conditions need to met before executing the further code in the function.
        require(currentStatus == Statuses.Vacant, "Currently Occupied.");
        _; //runs the function body
    }

    modifier costs (uint _amount) {
        require(msg.value >= _amount, "Not enough Ether Provided.");
        _;
    }

    receive() external payable onlyWhileVacant costs(2 ether) { //external functions are meant to be called by external contracts. They cannot be called by internal function calls.
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        // fire the event
        emit Occupy(msg.sender, msg.value);
    }
}