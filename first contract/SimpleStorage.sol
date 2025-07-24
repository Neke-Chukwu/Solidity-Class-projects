// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //solidity version

contract simplestorage {
     
     uint256 public myFavoriteNumber; //default =0

     struct person {
        uint256 favoriteNumber;
        string name;
     }

     person[] public listOfPeople;// []

     mapping(string =>uint256) public nameToFavoriteNumber;

    

     function store (uint256 _favoriteNumber) public virtual 
     {
        myFavoriteNumber = _favoriteNumber; 
    }
     
     function retriveve() public view returns(uint256){
        return myFavoriteNumber;
     }
     
     function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push( person({favoriteNumber: _favouriteNumber, name: _name}));
        nameToFavoriteNumber[_name] = _favouriteNumber;
     }

}

//this solidity code is a smart contract {firstcontract} that allows users to store and retrieve favorite numbers and add people with their favorite numbers and names. it includes functions to store a favorite number, retrieve the stored number, and add a person with a favorite number and name to the list.The contract also uses a mapping to associate names with favorite numbers. The code is designed to manage favorite numbers and people's information within the blockchain.
//Github @hack-mantis 
