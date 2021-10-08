/**
 *Submitted for verification at Etherscan.io on 2021-10-06
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";


contract E {
    address public sender;
    
    function callA(address a) public returns(bool, bytes memory) {
        return address(a).delegatecall(
            abi.encodeWithSignature("setSender()")
        );
    }
}

contract D {
    address public sender;
    
    function callE(address e, address a) public returns(bool, bytes memory) {
        return address(e).delegatecall(
            abi.encodeWithSignature("callA(address)", a)
        );
    }
}

contract C {
    address public sender;
    
    function callD(address d, address e, address a) public returns(bool, bytes memory) {
        return address(d).call(
            abi.encodeWithSignature("callE(address,address)", e, a)
        );
    }
}

contract B {
    address public sender;
    address public contratoNuevo;
    
    function callC(address c, address d, address e, address a) public returns(bool, bytes memory) {
        return address(c).delegatecall(
            abi.encodeWithSignature("callD(address,address,address)", d, e, a)
        ); 
    }
    
    function setContract(address contractAddress) public 
    {
        console.log("contrato B", contractAddress);         
        contratoNuevo = contractAddress;
        console.log("addres ", contratoNuevo);
    }

     function setSender() public {
        sender = msg.sender;
    }

}

contract A {
    address public sender;       

    function setSender() public {
        sender = msg.sender;
    }
    
    function callB(address b, address c, address e, address d) public returns(bool, bytes memory){
        return b.delegatecall(
            abi.encodeWithSignature(
                "callC(address,address,address,address)", 
                c,
                d,
                e,
                address(this)
            )
        );
    }

    function setContract(address b) public returns (bool, bytes memory) {        
        return b.delegatecall(
            abi.encodeWithSignature(
                "setContract(address)", msg.sender)
        );
    }

}