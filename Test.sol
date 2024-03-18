// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Test {
    /**
    *
    *State Variables
    */
    /// @notice 用来标记当前进度
    /// @dev 0  等待
    /// @dev 1  等待会回复
    /// @dev 2  "大家好"
    /// @dev 3  "为你服务"
    /// @dev 4  等待销毁、
    /// @return 当前的步骤
    uint8 public step=0;
    address public immutable leader;

    string internal constant UNKNOWN = unicode"不知道";

    /**
     * Events
     *
     */

    /// @notice 当前step被修改
    /// @dev  step 发生变化，抛出
    /// @param 当前的step
    event Step(uint8);

    /// @notice 金额变动通知
    /// @dev   金额发生变化，抛出事件
    /// @param tag  标记内容
    /// @param from 当前调用地址
    /// @param value 当前发送金额
    /// @param data  当前调用的DATA
    event Log(string tag, address from,uint256 value,bytes data);

    /**
     *
     *Modifier
     */

    /// @notice 检查只能领导调用
    /// @dev 用于领到是使用的函数
    modifier onlyLeader(){
        require(msg.sender == leader,unicode"必须是当前领导地址");
        _;  // 当前函数放在这里执行
    }

    /// @notice 检查非领导调用
    /// @dev 用于非领导是使用的函数
    modifier notLeader(){
        require(msg.sender != leader,unicode"领到不能说");
        _;
    }
    /**
    *
    *Errors
    */

    /// @notice 自定义错误
    /// @dev 所有以知错误

    /// 这是自定义错误: 上方空一行
    error MyError(string msg);

    /**
     *
     *Constructor
     */
    constructor(address leader_){
        require(leader_ != address(0), "invalid address");
        leader = leader_;
    }

    /**
     * Functions
     *
    */
    function hello(string calldata content) external onlyLeader returns(bool){
        if(step!=0){
            revert(UNKNOWN);
        }
        if(
            !review(content,unicode"大家好")
        ){
            revert MyError(unicode"领到必须说:大家好");
        }
        step = 1;
        emit Step(step);
        return true;
    }

    /**
     * Helper
     *
    */
    function review(string calldata content, string memory correctContent)
    private
    pure
    returns(bool) {
        return keccak256(abi.encodePacked(content)) ==  keccak256(abi.encodePacked(correctContent));
    }

    receive() external payable {
        emit Log("receive",msg.sender,msg.value,"");
    }

    fallback() external payable {
        emit Log("fallback",msg.sender,msg.value,msg.data);
    }

    /// @notice 获取当前合约余额
    /// @dev  合约金额辅助FUN
    /// @return uint 余额
    function getBalance() external view returns(uint256) {
        return address(this).balance;
    }
}
