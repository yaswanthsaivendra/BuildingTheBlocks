//We need to prevent overflows and underflows of our ints.
//for that we use openzeppelings safemath library.
//we use safemath's add,sub,mul and div functions in our smart conracts code in place of normal +, - * and % to avoid overflows.


pragma solidity >=0.5.0 <0.6.0;

import "./16_safemath.sol"; //It consists of functions for uint256 , we can  similarly create for other uints by replacing all instances of uint256 by other uints.

contract SimpleContract {
    using SafeMath for uint256;

    uint256 a = 5;
    uint256 b = a.add(3); // 5 + 3 = 8
    uint256 c = a.mul(2); // 5 * 2 = 10

}


