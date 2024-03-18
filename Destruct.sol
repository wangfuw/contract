// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Destruct {
    uint256 public aaa = 13;

    constructor() payable{}

    function kill() external {
        selfdestruct(payable(msg.sender));
        //把合约里面的资金 发送给方法的调用者
    }

    function bbb() external pure returns(uint256) {
        return  1;
    }

    fallback() external {}
    receive() external payable {}
}

// msg.sender  == Helper address
contract helper {
    // 没有 fallback receive 正常没办法接受ETH
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // kill 后，此时Helper 余额就会强制收到ETH
    function kill(Destruct _kill) external {
        _kill.kill();
    }

}