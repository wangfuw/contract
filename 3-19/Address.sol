// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Address {
    // 地址转换：
    address public _owner; // 16进制
    uint160 public  _ownerUint; // 10进制

    constructor() {
        _owner=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        _ownerUint=520786028573371803640530888255888666801131675076;

    }

    function toUint160() public view returns(uint160) {
        return uint160(_owner);
    }

    function toAddress() external view returns(address) {
        return address(_ownerUint);
    }
}

contract Demo {
    function getBalance(address _ads) public view returns(uint256)  {
        return _ads.balance;
    }

    function getBalance2() external view returns(uint256) {
        return address(msg.sender).balance;
    }

}