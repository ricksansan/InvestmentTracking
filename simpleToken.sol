// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract myFirstToken{
    string public name= "VitalikButerin";
    string public symbol= "VB";
    uint256 public totalsupply;

    mapping(address=>uint256) public balances;

    constructor(uint256 _initialSupply){
        totalsupply=_initialSupply;
        balances[msg.sender]+=_initialSupply;
    }

    function transfer(address _to,uint256 _amount) public payable{
          require(balances[msg.sender]>=_amount,"Yetersiz token bakiyesi");
          require(_amount<= totalsupply/10,"Transfer miktari arzin yuzde 10'undan fazla olamaz");
          balances[msg.sender]-=_amount;
          balances[_to]+=_amount;

    }
    function balanceOf(address _owner) public view returns(uint256){
        return balances[_owner];
    }
}