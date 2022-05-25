// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

contract Array {
    //Arrays
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["apple", "banana", "carrot"];
    string[] public values;

    // uint[10] arr;    fixed array
    // uint[] arr;      dynamic array

    //2D array
    uint[][] public array2D = [ [1, 2, 3], [4, 5, 6] ];

    //function to add values to the end of the array.
    function addValues(string memory _value) public {
        values.push(_value);
    }
    //here the variable "value" is stored in memory.
    //we use this keyword memory while we are using reference types.
    //we can pass arguments to a function via 2 ways.
    //1. directly passing value.    - used in case of passing integers.(here original value will be copied to a new variable).
    //2. passing their reference    - used in case of arrays, mappings, strings and structs.
    // By default reference types refer to storage, So if we directly pass them , changes done to them will change the original value.
    //So using memory keyword will let them to use memory rather than storage and it wont affect original ones.

    //starting parameter names with an underscore is a convention.

    function valueCount() public view returns(uint){
        return values.length;
    }

    //In solidity, functions can be public(we can call this function from other contracts) or private(we can only call these functions from the same contract in which it exists).
    //To avoid security risks, we should prefer creating functions as private.
    //names of private functions start with a underscore as a convention.
}