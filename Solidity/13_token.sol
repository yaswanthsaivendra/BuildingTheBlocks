//Token
// A token is a thing which someone can own.
//A token can be currency , shares, loyality points or even gold certificates.
//A token can be created by a smart contract and that smart contract is responsible for
//1. creating tokens
//2. handling transactions
//3. keeping track of balances of each token holder.
// TO get tokens, one needs to send ether to this smart contract.

//To create these tokens, we have a set of standards to follow.
// these standards are created so to avoid bugs in our smart contract handling tokens and to avoid the hustle of exchange with other tokens and support by wallet providers.

//ERC20     Ehtereum Requests for comments      - a standard defined to create tokens.
//It consists of some mandatory and optional functions which we can use as an interface to create our own tokens.
//these are fungible tokens.
//These ERC20 tokens are used for things like curriencies coz they are divisible.

//ERC721    standard for nun fungible tokens.
//ERC20 represents a single entity whereas ERC721 represents collection of assests.
//and ERC721 is indivisible so it used for crypto collectibles.


//If we follow the standards, everyone share the same functions which are there in the standard so it will be easier for outer entities to interact with any ERC standard token using the same code.