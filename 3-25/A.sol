// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract A {
    uint256 public a = 123;
    fallback() external {}
    receive() external payable {}
}

contract C {
//    A public a1;
    A public a2 = new A();

    function getA1(A _a) external pure returns(address , address)  {
        return (address(_a),payable((address(_a))));
    }

    function getA2() external view returns(address,address) {
        return (address(a2) , payable(address(a2)));
    }

    function test1(A _a) external view returns(uint256)  {
        return _a.a();
    }

    function test2() external view returns(uint256) {
        return a2.a();
    }
}
