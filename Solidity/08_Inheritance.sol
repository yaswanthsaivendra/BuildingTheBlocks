pragma solidity >=0.5.0 <0.6.0;

import "./07_Inheritance.sol";  //import statement lets use all public functions from that file.
//Inheritance can be used based upon inheritance concept and also simply for organising code by grouping similar code into contracts.

//Inherited from Ownable contract(which is in 07_Inheritance.sol file).
contract MyNewContract is Ownable {

}
