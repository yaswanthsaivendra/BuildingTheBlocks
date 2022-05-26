pragma solidity >=0.5.0 <0.6.0;

// Running code on blockchain will cost gas, so code optimization is an important aspect in case of blockchain.

// we know that, we have subtypes of uints: uint8, uint16 and uint32 etc.
// but there is no benefit in using these subtypes(in direct usage) as solidity reserves 256 bits size for uint size.
// but there is an exception : inside structs

//If you have multiple uints inside a struct, using a smaller-sized uint when possible
// will allow Solidity to pack these variables together to take up less storage.

contract MyContract {

struct NormalStruct {
  uint a;
  uint b;
  uint c;
}

struct MiniMe {
  uint32 a;
  uint32 b;
  uint c;
}

// `mini` will cost less gas than `normal` because of struct packing
NormalStruct normal = NormalStruct(10, 20, 30);
MiniMe mini = MiniMe(10, 20, 30);

}

//clustering identical data types together(right next to each other) will also mimize the storage space required.
//For ex:
// a struct with fields uint c; uint32 a; uint32 b; will cost less gas than a struct with fields uint32 a; uint c; uint32 b;



//Time units
// now      returns current unix timestamp - no. of seconds elasped since jan 1st 1970.
// seconds, minutes, hours, days, weeks and years       these can be used(all of these will be converted to seconds internally).



//"calldata" is same as like "memory" keyword but it should be only used in functions with external visibility.


//view functions don't cost any gas when they're called externally by a user.
//this is because view functions dont actually change anything on the blockchain.
//so whenever we mark a function as view function and an user called it externally then its only going to query local node and its not going to create any transaction(running on blockchain) so it wont cost any gas.
//So, we can optimize our DApp's gas usage for our users by using read-only external view functions wherever possible.


// Whenever possible avoid using storage.
//In solidity using storage is lot more costly then running for loops multiple times.