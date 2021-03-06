const assert = require('assert');
const { ethers } = require("hardhat");

//const hardhat = require("hardhat");
//const { etherjs, BigNumber, utils} = require('ethers');


let contractA
let contractB
let contractC
let contractD
let contractE

let owner;
let addr1;


beforeEach(async function(){

    [owner, addr1] = await ethers.getSigners();

    const factoryA = await ethers.getContractFactory("A");  
    const factoryB = await ethers.getContractFactory("B");  
    const factoryC = await ethers.getContractFactory("C");  
    const factoryD = await ethers.getContractFactory("D");  
    const factoryE = await ethers.getContractFactory("E");  

    contractA = await factoryA.deploy();   
    contractB = await factoryB.deploy();   
    contractC = await factoryC.deploy();   
    contractD = await factoryD.deploy();   
    contractE = await factoryE.deploy();   

   
    // await contractA.deployed();
    // await contractB.deployed();
    // await contractC.deployed();
    // await contractD.deployed();
    // await contractE.deployed();

});


describe("pluzzle", function () {

    it("Pruebas de sender", async function () {

        

        // console.log("A--> "+contractA.address.toString())
        //  console.log("B--> "+contractB.address.toString())
        //  console.log("C--> "+contractC.address.toString())
        //  console.log("D--> "+contractD.address.toString())
        //  console.log("E--> "+contractE.address.toString())
        console.log("Owner--> "+owner.address.toString())    

        // console.log((await contractB.sender()).toString());

        // await contractB.setSender({
        //     from: owner.address
        // });

        // console.log((await contractB.sender()).toString());

        //await stateMachine.connect(userTwo).sign();

        //console.log("1 " + (await contractA.sender()).toString())
        try {
            let [uno, dos] = await contractA.connect(owner).callB(
                contractB.address,
                contractC.address,
                contractD.address,
                contractE.address)
        } catch (error) {
            console.log(error)
        }
      

        //console.log("2 " + (await contractA.sender()).toString())

        

        //console.log("contrato llega " + (await contractB.contratoNuevo()).toString())

    });

});