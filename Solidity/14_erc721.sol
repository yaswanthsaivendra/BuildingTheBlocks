pragma solidity >=0.5.0 <0.6.0;

//Interface for ERC721

contract ERC721 {
  event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

    // This function simply takes an address, and returns how many tokens that address owns.
  function balanceOf(address _owner) external view returns (uint256);

    // This function takes a token ID , and returns the address of the person who owns it.
  function ownerOf(uint256 _tokenId) external view returns (address);

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
  function approve(address _approved, uint256 _tokenId) external payable;
}

// Note that the ERC721 spec has 2 different ways to transfer tokens:

// 1.
// function transferFrom(address _from, address _to, uint256 _tokenId) external payable;

/* The first way is the token's owner calls transferFrom with his address as the _from parameter,
the address he wants to transfer to as the _to parameter,
and the _tokenId of the token he wants to transfer.
*/

//// and

// 2.
// function approve(address _approved, uint256 _tokenId) external payable;
// function transferFrom(address _from, address _to, uint256 _tokenId) external payable;

/*The second way is the token's owner first calls approve with the address he wants to transfer to,
 and the _tokenID . The contract then stores who is approved to take a token,
usually in a mapping (uint256 => address). Then, when the owner or the approved address calls transferFrom,
the contract checks if that msg.sender is the owner or is approved by the owner to take the token, and if so it transfers the token to him.
*/





//we can inherit from multiple contracts by making use of comma.
//ex:

contract Animal {

}
contract Cat {

}
contract Kittie is Cat, Animal {

}