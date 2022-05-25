pragma solidity ^0.6.0;

contract TypeCasting {
    uint a = 5;
    uint8 b = 10;

    uint8 c = b * uint8(a);
}