// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract C {
    // storage  memory函数内
    uint256 public age = 18;

    // struct 结构
    struct MyStruct{
        string name;
        uint256 age;
    }

    // mapping
    mapping(address=>MyStruct) public myStructs;


    function test() external returns(MyStruct memory){
        myStructs[msg.sender] = MyStruct({
            name:"wangfuw",
            age:18
        });
        //storage
        MyStruct storage myStruct1 = myStructs[msg.sender];
        myStruct1.age++;  // 会储存在状态变量中
        return myStruct1;
    }

    function test1() external returns(MyStruct memory){
        myStructs[msg.sender] = MyStruct({
            name:"wangfuw1",
            age:18
        });
        //memory
        MyStruct memory myStruct1 = myStructs[msg.sender];
        myStruct1.age++;  //不会储存到状态变量中
        return myStruct1;
    }


    // function add(uint256 _a, uint256 _b) public pure returns(uint256,uint256[] memory) {
    //     //memory 存储的位置
    //     // uint256[] memory localArray;
    //     // uint8[3] memory numsFixed = [1, 2, 3];
    //     uint256[] memory a = new uint256[](5);

    //     for (uint256 i = 0; i < a.length; i++) {
    //         a[i] = i * 2;
    //     }

    //     uint256 sum = _a + _b;

    //     return (sum, a);
    // }

    // function test(string memory name_,uint256[] memory mm_)
    // public
    // pure
    // returns(uint256[] memory memArr,string memory myName){
    //     memArr = new uint256[](mm_.length);
    //     myName = name_;

    //     for (uint256 index = 0; index<mm_.length; index++)
    //     {
    //         // memArr.push(mm_[index]);
    //         memArr[index] = mm_[index] * 2;
    //     }

    // }

}
