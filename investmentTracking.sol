// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract investmentTracking {

    mapping (address => uint) public balances;
    mapping (address => uint) public depositTimes;

    function deposit() public payable {
        require(msg.value>0, "Yatirim miktari 0'dan buyuk olmali");
        balances[msg.sender]+=msg.value;    
        depositTimes[msg.sender]=block.timestamp; //Yatırım zamanını kaydet
    }
    
}
