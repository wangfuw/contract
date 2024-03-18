// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Wei {
    uint256 public amount;
    constructor(){
        amount = 1;
    }

    function fnEth() public view returns(uint256) {
        return amount + 1 ether;
    }

    function fnGwei() public view returns(uint256) {
        return amount + 1 gwei;
    }
    // 这些后缀不能直接用在变量后面。 如果想用以太币单位来计算输入数量 -- todo
    function testVar(uint256 amountEth) public view returns(uint256) {
        return amount + amountEth * 1 ether;
    }
}
