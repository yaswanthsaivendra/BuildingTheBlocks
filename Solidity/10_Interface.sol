pragma solidity >=0.5.0 <0.6.0;

// Interface
// For our contract to talk with another contract on the blockchain that we dont own, we use interfaces.

//this is a simple smart contract
contract LuckyNumber {
  mapping(address => uint) numbers;

  function setNum(uint _num) public {
    numbers[msg.sender] = _num;
  }

  function getNum(address _myAddress) public view returns (uint) {
    return numbers[_myAddress];
  }
}
// in this contract we need to interact with getNum function.
// So we will create an interface for the LuckyNumber contract particularly with getNum function.

contract NumberInterface {
    function getNum(address _myAddress) public view returns (uint);
}

// now we can use it in an contract as
contract MyContract {
  address NumberInterfaceAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
  // ^ The address of the LuckyNumber contract on Ethereum
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
  // Now `numberContract` is pointing to the other contract

  function someFunction() public view {
    // Now we can call `getNum` from that contract:
    uint num = numberContract.getNum(msg.sender);
    // ...and do something with `num` here
    num++;
  }
}

// In solidity, there is no direct string comparision, so we will compare keccak256 hashes of strings.
// ex :
// keccak256(abi.encodePacked("string1")) == keccak256(abi.encodePacked("string2"));

