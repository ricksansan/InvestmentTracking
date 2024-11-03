// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract SimpleWallet{

    mapping (address => uint) public balances;
    address public owner;
    

    constructor () payable {
    require(msg.value > 0,"Kontrat'i olusturmak icin 0'dan fazla ethereum gondermelisiniz"); 
    owner =msg.sender;
    }
    //kullanıcının kontrata ether göndermesi için gerekli olan
    function deposit() public payable {
    require(msg.value > 0, "Sifir'dan fazla Ether gondermelisiniz.");
    balances[msg.sender]+=msg.value;
    }

    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }
    function getOwner() public view returns(address){
      return owner;
    }
    //kontrat sahibinin tüm bakiyeyi çekmesini sağlayan fonksiyon
    function withdrawOwner(uint amount) public {
    require(msg.sender==owner, "sadece kontrat sahibi cekim yapabilir");
    require(amount <= address(this).balance,"yeterli bakiye yok");
    payable(owner).transfer(amount); //owner'a transfer
    }

    function withdraw(uint amount) public{
        require(amount<=balances[msg.sender],"Yetersiz bakiye");
        balances[msg.sender] -= amount; //Kullanıcı bakiyesini düş.
        payable(msg.sender).transfer(amount); //transfer et
            }
 
}
