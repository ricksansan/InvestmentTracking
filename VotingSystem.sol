// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract votingSystem{

    address public owner;
     //contrat'ın sahibini yetkili yapma
    constructor(){
        owner=msg.sender;
    }
    //Yetki kısıtlaması için modifier
    modifier onlyOwner() {
    require(msg.sender == owner, "Bu islemi sadece kontrat sahibi yapabilir.");
    _;
     }
     // Oy takibi için gerekli mappingler
      mapping(address => uint256) public votes;
      mapping(address => uint256) public candidateVotes;
      mapping(address => bool) public hasVoted;


      address[] public candidate;
      mapping(address => bool) public isCandidate;


    function addCandidate(address _candidate) public onlyOwner{
        //mevcut adayların eklenmesini engelleme
       require(!isCandidate[_candidate], "Bu aday zaten mevcut.");
       candidate.push(_candidate);
      isCandidate[_candidate] = true;
}
function vote(address _candidate) public {
        // Oy verilip verilmediğini kontrol et
        require(!hasVoted[msg.sender], "Bu kullanici zaten oy kullanmis.");

        //aday olmayan adreslere oy vermeyi engelleme
        require(isCandidate[_candidate], "Bu adres aday degil.");

        
        // Oy verildikten sonra hasVoted mapping'ini güncelliyoruz.
        hasVoted[msg.sender] = true;
        
        // Adayın aldığı oy sayısını artırıyoruz
        candidateVotes[_candidate] += 1;
    }
    
    // Belirli bir adayın aldığı toplam oy sayısını döndüren fonksiyon
    function getVotes(address _candidate) public view returns (uint256) {
        return candidateVotes[_candidate];
    }
    // Adayları döndüren fonksiyon  
    function getCandidates() public view returns (address[] memory) {
    return candidate;
}
}


