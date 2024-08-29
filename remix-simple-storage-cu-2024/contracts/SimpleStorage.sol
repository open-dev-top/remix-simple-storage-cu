// SPDX-License-Identifier: MIT
// pragma solidity 0.8.19; // Accurate version
// pragma solidity ^0.8.19; // Better compatibility
// pragma solidity >=0.8.19 <0.9.0; // May be better, but not simple
pragma solidity 0.8.24; // Compatible with zksync plugin: v5.0.0-0

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes(string)
    bool public hasFavoriteNumber = false;
    uint256 private favoriteNumber;
    int internal  favoriteNumberInInt = 0;
    string favoriteNumberInText = "0";
    address myAddress = 0xF805636A05Bb396faF9Bb6954F4112d8c8F6B104;
    bytes32 favoriteBytes32 = "Hello World!";

    // Array and Struct

    struct Person{
        string name;
        uint256 myFavoriteNumber;
    }
    
    Person[] public listOfPersons;
    mapping(string name => uint256 favoriteNumber) public nameToFavoritenumber;

    // Function
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
        hasFavoriteNumber = true;
    }

    function storeAndPlus(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
        favoriteNumber += 1;
        hasFavoriteNumber = true;
    }

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    function addPerson(string calldata _name, uint256 _myFavoriteNumber) public {
        // Person memory newPerson = Person({name: _name, myFavoriteNumber: _myFavoriteNumber});
        listOfPersons.push(Person({name: _name, myFavoriteNumber: _myFavoriteNumber}));
        nameToFavoritenumber[_name] = _myFavoriteNumber;
    }
}