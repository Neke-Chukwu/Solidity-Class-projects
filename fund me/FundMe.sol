//Get funds from users
//withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract FundMe {

    uint256 public minimiumUsd = 5;

    function fund () public payable {
        require(msg.value >  minimiumUsd , "You must send more than minimum USD");

    }
     
    function getPrice() public {
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
    }
    function getConversionRate() public{}

}