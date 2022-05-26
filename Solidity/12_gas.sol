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