// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Enum {
    enum Status{
        None,
        Pending,
        Ship,
        Completed,
        Rejected,
        Canceled
    }

    Status public status;

    function set(Status _status) external {
        stats = _status;
    }

    function getStatus() public view returns(Status) {
        return status;
    }

    function getDefaultStatus() public view returns(uint256) {
        return uint256(status);
    }

    function ship() external {
        status = Status.Ship;
    }
    // 重置为0
    function reset() external {
        delete status;
    }
    //枚举最大
    function getLargeValue() public pure returns(Status) {
        return type(Status).max;
    }
    // 最小
    function getSmallValue() public pure returns(Status) {
        return type(Status).min;
    }
}
