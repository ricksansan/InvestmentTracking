// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProfile {
  
    address public owner;
    constructor() {
        
        owner=msg.sender;
        
    }

    struct Users{
        string name;
        uint256 age;
    }

   //Users user;
   mapping (address => Users) public userProfiles;

    function setUserProfile(address _user, string memory _name, uint256 _age) public {
    
    userProfiles[_user]=Users(_name,_age);

    }

    function  getUserProfile(address _user) public view returns(Users memory){
     return userProfiles[_user];
    }
    function updateUserProfile(address _user, string memory _name, uint256 _age) public {
        require(msg.sender==owner,"Bu fonsiyonu yanlizca kontrat sahibi cagirabilir");
        userProfiles[_user].name=_name;
        userProfiles[_user].age=_age;
    }
}