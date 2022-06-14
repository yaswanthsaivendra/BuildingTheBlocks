# BuildingTheBlocks
Blockchain development - Ethereum

# Roadmap


# Concepts
## Solidity
1. Intro 
    - SPDX-License-Identifier, pragma
    - basic structure of contract
    - statically typed language
    - constructor function
2. Value types : uint, int, bool, strings address
    - uint,int : uint[1-256], uint is an alias of uint256
    - address : address, address payable 
        - address payable : send, transfer
3. Contract types : contracts
4. Reference types :

3. functions, function modifiers ,Enum types, struct types, arrays(fixed/variable length, 1D/2D), mappings(nested)
4. state variables vs local variables
5. Math operations
6. visibility of functions(public/private and internal/external)
7. pure/view modifiers
8. storage vs memory
9. conditionals/Loops
10. Global Variables
11. Typecasting
12. Working with ether
13. Custom modifiers
14. events and errors(revert statements)
15. Inheritance
16. Interfaces and Libraries

# Note 
(Dealing with date/time in solidity)[https://soliditytips.com/articles/solidity-dates-time-operations/]
Note : `now` is deprecated in 0.7.0. Now we should use `block.timestamp` only.