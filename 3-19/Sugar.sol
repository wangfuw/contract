// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Sugar {
    uint256 giftValue = 666;
    mapping(address=>uint256) public gifts;

    function gift() public returns(uint256) {
        bytes memory senderCode = getCode(msg.code);
        require(senderCode.length==0,unicode"只能用户地址领取,禁止如羊毛");
        gifts[msg.sender] = giftValue;
        return giftValue;
    }

    function getCode(address _ads) public view returns(bytes memory) {
        return address(_ads).code;
    }
}

contract Test{
    uint256 public target; //糖果
    constructor(address ads_){
        target = Sugar(ads_).gift();
    }
}
