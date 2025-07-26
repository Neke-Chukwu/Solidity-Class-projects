//Get funds from users
//withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {PriceConverter} from "./PriceConverter.sol";

error FundMe__NotOwner();

contract FundMe {

    using PriceConverter for uint256;


    uint256 public constant MINIMIUM_USD = 5e18;

    address [] public funders;
    mapping(address funder => uint256 amountFunded) public addressToamountFunded;

    address public immutable i_owner;
    constructor () {
        i_owner = msg.sender;
    }

    function fund () public payable {
        require(msg.value.getConversionRate() >  MINIMIUM_USD , "You must send more than minimum USD");
        funders.push(msg.sender);
        addressToamountFunded[msg.sender] = addressToamountFunded[msg.sender] + msg.value;

    }
     
    function withdraw () public onlyOwner {
        for (uint256 funderIndex =0; funderIndex < funders.length; funderIndex++) 
        {
            address funder = funders[funderIndex];
            addressToamountFunded[funder] = 0;
        }

        funders = new address [](0);


        //sending eth to a contract methods
        //transfer method
        /*payable (msg.sender).transfer(address(this).balance);
        //send method
        bool sendSuccess = payable (msg.sender).send(address(this).balance);
        require(sendSuccess, "send failed");*/

        //call method
        (bool callSuccess, ) = payable (msg.sender).call{value:address(this).balance}("");
        require (callSuccess, "call failed");

    }

    modifier onlyOwner {
        //require(msg.sender == i_owner, "Must FundMe owner!");
        //new {if error handling} method
        if(msg.sender != i_owner) {revert FundMe__NotOwner();}
        _;
    }

}