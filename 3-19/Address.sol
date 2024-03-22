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


contract Demo1 {

    event Transfer();
    function getBalance() external view returns(uint256) {
        return address(this).balance;
    }

    receive() external payable {}

    // function transfer(uint num) external view returns(bool){
    //     require(address(this).balance > num);
    //     msg.value = num
    //     return true;

    // }
}

contract Code{
    function getCode() external view returns(bytes memory){
        return address(this).code;
    }

    function getCodeByKeccak256() public view returns(bytes32){
        return keccak256(address(this).code);
    }

    function getCodeHash() public view returns(bytes32){
        return address(this).codehash;
    }

}

contract AddressM{

    mapping(address => uint256)  public balances;

    // 存钱 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4  12
    // 存钱 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2  1
    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }

    function getAddress123() external view returns(address){
        return address(this);
    }

    function getBalance1() external view returns(uint256){
        return address(this).balance;
    }
    function getSenderBalance() external view returns(uint256){
        return address(msg.sender).balance;
    }


    function getAddressZ() external pure returns(address,address,address){
        return (address(0),address(1),address(2));
    }

}

contract Payable{
    //方法1 直接申明可转账地址 0x583031D1113aD414F02576BD6afaBfb302140225
    address payable public owner;

    constructor(){
        // 直接赋值会报错, msg.sender 不是payable 类型的地址
        // owner = msg.sender

        // 使用payable 转换  1 转换
        owner = payable(msg.sender);
    }

    // The called function should be payable if you send value and the value you send should be less than your current balance.
    // Debug the transaction to get more information.

    // 没有payable 传eth 报错
    function deposit1() external {}

    //可以发送ETH
    function deposit2() external payable {}

    function getBalance() external view returns(uint256){
        return address(this).balance;
    }
}

contract SendE{
    event Log(string funName, address from, uint256 value,bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

    function getBalance() external view returns(uint256){
        return address(this).balance;
    }

    //transfer 地址 必须为 payable
    // 参数中 地址标注 address payable 并且函数标注 payable 省gas
    function transferOne(address payable _to) external payable {
        _to.transfer(100);
    }

    function transferTwo(address _to) external {
        payable(_to).transfer(200);
    }

    function send1(address payable _to) external payable {
        bool success = _to.send(100);
        require(success,"Send Failed");
    }

    function send2(address _to) external {
        bool success = payable(_to).send(200);
        require(success,"Send Failed");
    }

    function call1(address payable _to) external payable {
        (bool success,) = _to.call{value:100}("");
        require(success,"call Failed");
    }

    function call2(address _to) external {
        (bool success,) = payable(_to).call{value:200}("");
        require(success,"call Failed");
    }

    // call 地址不需要payable 方法也不需要payable   可以给定gas 一般写
    function call3(address  _to) external  {
        (bool success,bytes memory data) = _to.call{value:100}("");
        require(success,"call Failed");
    }

    function call4(address _to) external {
        (bool success,bytes memory data) = _to.call{value:200,gas:800}("");
        require(success,"call Failed");
    }
}

