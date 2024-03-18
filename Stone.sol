// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Stone {
    uint256 public age = 0;
    event evenFallback(string);

    fallback() external{
        age++;
        emit evenFallback("fallback");
    }
}

interface AnimalEat{
    function eat() external returns(string memory);
}

contract Animal{

    function test1(address _addr) external returns(string memory)  {
        AnimalEat general = AnimalEat(_addr);
        return general.eat();
    }

    function test2(address _addr) external returns(bool success)  {
        AnimalEat general = AnimalEat(_addr);
        (success,) = address(general).call(abi.encodeWithSignature("eat()"));
        require(success);
    }
}
