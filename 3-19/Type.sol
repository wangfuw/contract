// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//自定义 18 位小数 256 bit 的浮点 类型
type UFixed256x18 is uint256;

library FixedMath{
    uint constant multiplier = 10**18;

    // UFixed256x18相加
    function add(UFixed256x18 a,UFixed256x18 b) internal pure returns(UFixed256x18)  {
        return UFixed256x18.wrap(UFixed256x18.unwrap(a) + UFixed256x18.unwrap(b));
    }
    // UFixed256x18 和 uint256 相乘
    function mul(UFixed256x18 a,uint256 b) internal pure returns(UFixed256x18)  {
        return UFixed256x18.wrap(UFixed256x18.unwrap(a) * b);
    }
    // 向下取整
    function floor(UFixed256x18 a) internal pure returns(uint256)  {
        return UFixed256x18.unwrap(a) / multiplier;
    }

    // uint256 转换为 UFixed256x18
    function toUFixed256x18(uint256 a) internal pure returns(UFixed256x18) {
        return UFixed256x18.wrap(a * multiplier);
    }
}
//UFixed256x18.wrap  // 系统默认的
//FixedMath.toUFixed256x18  // 自定义的
contract Type {
    uint256 a = 1;
    uint256 b = 2;

    function testAdd() public view returns(UFixed256x18) {
        return FixedMath.add(FixedMath.toUFixed256x18(a),FixedMath.toUFixed256x18(b));
    }

    function testMul() external view returns(UFixed256x18) {
        return FixedMath.mul(FixedMath.toUFixed256x18(a),b);
    }

    function testFloor() external view returns(uint256) {
        return FixedMath.floor(testAdd());
    }
}
