// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {simplestorage} from "./SimpleStorage.sol";

contract AddFiveStorage is simplestorage{



    function store (uint256 _number) public override {

        myFavoriteNumber = _number + 5;

        
    }
}
     
    
   