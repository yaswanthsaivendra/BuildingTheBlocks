// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

contract Array {
    //Arrays
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["apple", "banana", "carrot"];
    string[] public values;

    //2D array
    uint[][] public array2D = [ [1, 2, 3], [4, 5, 6] ];

    //function to add values to the end of the array.
    function addValues(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns(uint){
        return values.length;
    }
}