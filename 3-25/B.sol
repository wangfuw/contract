// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract B {
    address public immutable owner;

    constructor(){
        owner  = msg.sender;
    }

    function getCode() public view returns(bytes memory) {
        return address(this).code;
    }
}

contract C {
    string public name=type(B).name;
    // 合约名称
    bytes public creationCode = type(B).creationCode;
    //     // 获取创建合约内存字节数
    ///"runtimeCode" is not available for contracts containing immutable variables.
    // bytes public runtimeCode = type(B).runtimeCode;

}
