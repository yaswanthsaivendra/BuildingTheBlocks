// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

contract Mapping {
    //Mappings
    mapping(uint => string) public names;
    mapping(uint => Book) public books;

    //Nested Mapping
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor() public{
        names[1] = "yash";
        names[2] = "Vendra";
        names[3 ] = "Sai";
    }

    //function to add books
    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }

    // function to add mybooks in nested mapping.
    function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}