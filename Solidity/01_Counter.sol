// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.6.0; //solidity version

contract Counter {
    //unsigned integer
    uint count;

    //runs only once, when we deploy this smart contract to blockchain
    constructor() public {
        count = 0;
    }

    //public - does mean that it can be accessible from outside of this smart contract.

    //function to read the count
    function getCount() public view returns(uint) { // view - does mean that not to modify the state but can read the state of variables and all.
        return count;
    }

    //function to update(increment) the value of count.
    function incrementCount() public {
        count = count + 1;
    }

}
        /* The same contract can be written in short as*/

contract CounterNew {
    //unsigned integer
    uint public count=0;    //using public will automatically create a function with name "count" to view the value of count.

    function incrementCount() public {
        count++;
    }
}