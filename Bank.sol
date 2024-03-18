// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 存钱罐合约: 多次存，一次取, 取完销毁
contract Bank {
    address public immutable owner;
    event Deposit(address _ads,uint256 amount);
    event Withdraw(uint256 amount);

    constructor(){
        owner = msg.sender;
    }
    receive() external payable{
        deposit();
    }

    function withdraw() external {
        require(msg.sender == owner,"Not owner address");
        emit Withdraw(address(this).balance);
        msg.sender.call{value:address(this).balance}("");
    }

    function deposit() public payable {
        emit Deposit(msg.sender,msg.value);

    }

    function getBalance() external view returns(uint256) {
        return address(this).balance;
    }

}
