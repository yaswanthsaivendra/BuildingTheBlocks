// SPDX-License-Identifier: GPL-3.0
// pragma - command means additional information will be taken care by compiler.
pragma solidity ^0.5.0; // use a version which is >=0.5.0 and <0.6.0

// solidity is a statically typed language (i.e, data types should be defined explicitly).

    /* Variables */
contract MyContract {
    // State Variables

    //Integers
    int public myInt = 1;
    uint public myUint = 1; //uint is an alias for uint256
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;

    //Strings
    string public myString = "Hello World!";
    bytes32  public myBytes32 = "Hello World!";

    // address
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // Struct
    struct Person {
        uint id;
        string name;
    }

    Person public myStruct = Person(1, "Yaswanth");




    // Local Variables

    function getValue() public pure returns(uint) { // pure - does mean that no state will be modified and not to read.
        uint value=1;
        return value;
    }

    // math operations
    /*

    +   addition
    -   subtraction
    *   Multiplication
    /   division
    %   modulo
    **  power

    */

}