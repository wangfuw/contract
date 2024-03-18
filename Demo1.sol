// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Hello.sol" as Test;  //本地导入
//https 导入
import "https://github.com/xxx";

/*安装扩展包到导入
 *npm install @sdsd
 *import "@adsd"
*/
contract Demo1 {
    function name() public pure returns(string memory)  {
        return type(Test).name;
    }

    function creationCode() public pure returns(bytes memory)  {
        return type(Test).creationCode;
    }

    function runtimeCode() public pure returns(bytes memory)  {
        return type(Test).runtimeCode;
    }
}


