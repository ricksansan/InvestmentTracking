// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract investmentLimit{

    mapping (address=> uint) public balances;
    mapping(address => uint) public lastWithdrawTime;
    mapping (address=> uint) public withdrawCount;

    uint constant dailyLimit = 0.1 ether;

   

    function deposit() public payable  {
        
        require(msg.value>0,"0'dan fazla ether gondermelisiniz.");
        balances[msg.sender]=msg.value;
    
    }
    // Kullanıcının günde 1 kez ve en fazla 0.1 ether çekmesini sağlayan fonsiyon
    function withdraw(uint _amount) public payable {
        require(_amount<=balances[msg.sender]  ,"uzgunuz bu kadar bakiyeniz yok");
        require(_amount<=dailyLimit,"Gunluk cekim limiti asildi.");
        require(block.timestamp>=lastWithdrawTime[msg.sender]+1 days,"gunluk limit icinde tekrar cekim yapamazsiniz");

        balances[msg.sender]-=_amount;
        lastWithdrawTime[msg.sender]=block.timestamp;
        withdrawCount[msg.sender]++;
       payable(msg.sender).transfer(_amount);

    }
     // Kullanıcının mevcut bakiyesini döndürür
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // Kullanıcının toplam çekim işlemi sayısını döndürür
    function getWithdrawCount() public view returns (uint) {
        return withdrawCount[msg.sender];
    }

}