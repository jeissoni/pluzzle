/**
 *Submitted for verification at Etherscan.io on 2021-10-06
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";


contract E {
    function callA(address a) public returns(bool, bytes memory) {
        console.log("A");

        (bool success, bytes memory data) = a.delegatecall(
            abi.encodeWithSignature("setSender()")
        );
        return (success, data);
    }
}

contract D {
    function callE(address e, address a) public returns(bool, bytes memory) {
            console.log("D");

        (bool success, bytes memory data) = e.delegatecall(
            abi.encodeWithSignature("callA(address)", a)
        );
        return (success, data);
    }
}

contract C {
    function callD(address d, address e, address a) public returns(bool, bytes memory) {
            console.log("C");

        (bool success, bytes memory data) = d.delegatecall(
            abi.encodeWithSignature("callE(address,address)", e, a)
        );
        return (success, data);
    }
}

contract B {
    function callC(address c, address d, address e, address a) public returns(bool, bytes memory) {
        console.log("B");
        
        (bool success, bytes memory data) = c.delegatecall(
            abi.encodeWithSignature("callD(address,address,address)", d, e, a)
        ); 
        return (success, data);
    }
}

contract A {
    address public sender;   
    
    function setSender() public {
        console.log(msg.sender);
        sender = msg.sender;
    }
    
    function callB(address b, address c, address d, address e) public returns(bool, bytes memory){
        
        console.log("b => ", address(this) );
        console.log("b => ",b );
        console.log("c => ",c );
        console.log("d => ",d );
        console.log("e => ",e );
                    
        (bool success, bytes memory data) = address(b).delegatecall(
            abi.encodeWithSignature(
                "callC(address,address,address,address)", 
                address(c),
                address(d),
                address(e),
                address(this)
            )
        );
        return (success, data);
    }
}