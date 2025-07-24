// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; //solidity version

import {simplestorage} from "./SimpleStorage.sol";

contract storageFactory{

    // uint256 public favourtieNumber
    // type  visibility  name
    simplestorage public myContract;


    function createSimpleStorageContract() public {
        myContract = new simplestorage() ; 

    }
}