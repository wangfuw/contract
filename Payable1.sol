// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable1 {
    event Log(string funName, address from, uint value, bytes data);

    // 只接受ETH
    receive() external payable{
        emit Log("receive",msg.sender, msg.value, "");
    }
    // 方法不存在 执行fallback
    fallback() external{}

    //通过balance 属性，查看余额
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

}