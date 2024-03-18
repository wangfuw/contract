// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Demo {

    address public owner1;
    address public owner2;
    address public owner3;

    constructor(){
        owner1 = address(this); //合约地址
        owner2 = msg.sender;

    }
    function fn() public view returns(address){
        return msg.sender;
    }

}
