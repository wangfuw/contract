// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract TestV {
    address public sender;
    uint256 public value;
    uint256 public num;

    function set(uint256 num_) external payable  {
        sender = msg.sender;
        value = msg.value;
        num = num_;
    }
}

contract TestV2 {
    address public sender;
    uint256 public value;
    uint256 public num;

    function set(uint256 num_) external payable  {
        sender = msg.sender;
        value = msg.value;
        num = num_ * 2;
    }
}

//委托测试调用
contract DelegateCall{
    address public sender;
    uint256 public value;
    uint256 public num;

    function set(address _ads,uint256 num_) external payable  {
        sender = msg.sender;
        value = msg.value;
        num = num_;
        // 不需要知道合约，函数自定义
        bytes memory data1 = abi.encodeWithSignature("set(uint256)",num_);
        // 合约调用用
        //bytes memory data2 = abi.encodeWithSignature(TestV.set.seletor,num_);
        (bool success,) = _ads.delegatecall(data1);
        require(success,"DelegateCall Failed");
    }
}
