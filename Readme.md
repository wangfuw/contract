事务:

1.原子性
2.A-> B 转账
3.out of gas

GAS:

交易:
    From->To 消息（二进制数据/ETH）
    遵守事务特性
地址:
    外部地址: 助记/私钥、地址
    合约地址： solidity 代码
    对于EVM 一样
        key:value
区块:
    区块可能会被回滚，交易可能作废
存储、内存、栈
    -存储:256 位: uint256 int256 bytes32
    -内存: 函数执行时候出现，完毕销毁
    -栈: 1024个元素，每个元素256 bit


合约代码:
remix 编译 部署 运行

注释: "//" ,"/**/","///" 

合约结构:
    SPDX: MIT 版权  UNLICENSED
    https://spdx.org/licenses  
    pragma solidity ^0.8.17: 版本限制
    contract: 关键字
        - 变量
        - 函数
        - this
        - 合约创建者/合约地址/合约调用者
        - type 关键字
            name 
            create
    
    遇到冲突的时候:
    import * as aaa from "./asda.sol"
    按需导入:
    import {symbol as aliasName, syymbol2} from "filename"

    interface:接口
    library：合约库

全局得以太币单位:
    'wei', 'gwei', 'ether'
    wei 最小
    1gwei 10e9
    1ETH = 10 ** 18
    变量的以太位

接受ETH:
-payable
    - function
    - address
- fallback
    - 语法: 
      - fallback() external [payable]  2300 gas 
      - fallback(bytes calldata input) external [payable] returns (bytes memory output)
      - msg.data 可以通过abi.decode([4:]) 解码 
    - 回调函数在情况调用
        - 向合约转账
        - 执行不存在的方法
    - 带参数的fallback
    - receive: 只负责接受主币
      - 'receive() external payable{}' payable 必须的
      - 没有 function 关键字
    - receive 和 fallback 共存调用
        ```
         调用时发送ETH
            |
      判断msg.data 是否 为 null
        |是              |否
      是否存在receive     fallback()
        |是   |否
      receive()  fallback()
      ```
    
合约自销毁: selfdestruct

-- 功能:
    - 销毁合约
    - 把合约的所有资金强制发送到目标地址
-- 即使一个合约的代码中没有显示的调用 selfdestruct , 仍然可以通过delegatecall callcode 执行销毁

总结：
- 合约的基本用法
- 合约的构造函数使用 -函数的基本用法
- 函数中条件判断和错误输出事件和事件触发
- NatSpec 用法演示
- 自定错误使用和触发，以及结合、NatSpec`抛出错误 fallback和‘receive`的使用和不同之处`immutable`不可变量的使用`constant’常量的使用 unicode 字面常量 -modifier 使用
- ‘keccak256’结合‘abi.encodePacked`判断字符串是否相同


WETH代币, 是包装ETH主币，作为ERC20的合约
 - 10ETH -> 10 WETH
 - 10 WETH -> 10 ETH
 - WETH 遵守ERC20 标准
ERC20 标准:
- 3个查询
    - balanceOf : 查询指定地址的Token 数量
    - allowance : 查询指定地址对另外有一个地址的剩余授权额度
    - totalSupply: 查询当前合约的Token总量
- 2个交易
    - transfer : 从当前调用者地址发送指定数量的Token 到指定地址
    - transferFrom : 当向另外一个地址合约存款时, 对方合约必须调用transferFrom 才可以把Token 拿到它的合约中 【代理转账】
- 2个事件
    - Transfer: 转账事件
    - Approval: 授权事件
- 1 个授权
    - approve : 授权指定地址可以操作调用者的最大Token 数量

solidity: 数据 3-19
    


