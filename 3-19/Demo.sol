// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Demo {
    uint256 public u = 12;
    string public str1 = "2312";
    string public str2 = "2312";
    // uint8 public x = 123;

    function test() external returns(uint256,string memory,string memory){
        // 值类型  函数 地址
        uint256 x = u;
        x = 1;

        // 引用类型 传递指针 storage memory  却别
        string storage s1 = str1;
        bytes(str1)[0] = bytes1("x");

        string memory s2 = str2;
        bytes(str2)[0] = bytes1("x");

        return (x,s1,s2);

    }
}

contract Demo3 {
    int8 public intMax = type(int8).max;
    int8 public intMin = type(int8).min;

    uint8 public uint8Max = type(uint8).max;
    uint8 public uint8Min = type(uint8).min;
}

contract Demo4 {
    uint8 public a = type(uint8).max;
    uint8 public b = 1;

    function f1() public view returns(uint8) {
        unchecked{
            return a + b;
        }
    }

    function f2() public view returns(uint8) {
        return a << 3;
    }
}

contract Demo5 {
    // 下划线
    uint256 public amount = 1000_0000_0000;
    uint256 public _a = -100_1000_1000;

    uint8 public a = (2**800 + 1) - 2**800;
    uint8 public b = 0.5 * 4;
}

contract Demo5 {
    // 下划线
    uint256 public amount = 1000_0000_0000;
    uint256 public _a = -100_1000_1000;

    uint8 public a = (2**800 + 1) - 2**800;
    uint8 public b = 0.5 * 4;
}


contract String1 {
    string public b1 ='a"b';
    string public b2 ="a'b";
    string public b1 ='a\"b';
}


//枚举 Enum


