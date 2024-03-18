// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Hello {
    //	3217 gas  -- 让合约使用更少得gas
    string  public message="Hello world"; //状态变量
    /*函数变量 	3181 gas */
    function fn1() public view returns (string memory) {
        return message;
    }
    //518 gas
    function fn2() public pure returns(string memory) {
        return "Hellow";
    }
    //3217 gas

    ///
    function fn3() public pure returns (string memory){
        return fn2();  // 直接调用
    }
}
