// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
   //payable 标记函数
    function deposit1() external payable  {}  // 发送ETH payable
    function deposit2() external {}

    //payable 标记地址
    function withdraw() external {
        payable(msg.sender).transfer(address(this).balance);
    }

    //通过balance 属性，查看余额
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }


}
