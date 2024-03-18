// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Receive {
    uint256 public X;
    uint256 public y;

    event Log(string funName, address from, uint256 value, bytes data);

    receive() external payable{
        x = 1;
        y = msg.value;
        emit Log("receive", msg.sender,msg.value,"");
    }

    fallback() external payable{
        x = 2;
        y = msg.value;
        emit Log("receive", msg.sender,msg.value,msg.data);
    }

    function getBalance() external view returns(uint256) {
        return address(this).balance;
    }


}
