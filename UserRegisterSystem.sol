// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProfile {
    
    // Kullanıcı bilgilerini saklamak için bir yapı (struct) oluşturduk
    struct User {
        string name;
        uint age;
    }

    // Kullanıcı adreslerine göre bilgileri saklamak için bir mapping
    mapping(address => User) private users;
    // Kullanıcıların kayıtlı olup olmadığını takip etmek için bir başka mapping
    mapping(address => bool) public isRegistered;

    // Kullanıcı kaydı için fonksiyon
    function register(string memory _name, uint _age) public {
        require(!isRegistered[msg.sender], "Kullanici zaten kayitli."); // Kullanıcının kayıtlı olup olmadığını kontrol et
        require(_age > 0, "Gecerli bir yas giriniz."); // Yaşın sıfırdan büyük olmasını şart koş
        
        users[msg.sender] = User(_name, _age); // Kullanıcı bilgilerini kaydet
        isRegistered[msg.sender] = true; // Kullanıcıyı kayıtlı olarak işaretle
    }

    // Kullanıcı bilgilerini güncellemek için fonksiyon
    function updateProfile(string memory _newName, uint _newAge) public {
        require(isRegistered[msg.sender], "Once kayit olmalisiniz."); // Kayıtlı olup olmadığını kontrol et
        require(_newAge > 0, "Gecerli bir yas giriniz."); // Yaşın sıfırdan büyük olmasını şart koş
        
        users[msg.sender] = User(_newName, _newAge); // Kullanıcı bilgilerini güncelle
    }

    // Belirli bir kullanıcının profilini görüntülemek için fonksiyon
    function getProfile(address _user) public view returns (string memory, uint) {
        require(isRegistered[_user], "Bu kullanici kayitli degil."); // Kullanıcının kayıtlı olup olmadığını kontrol et
        
        User memory user = users[_user]; // Kullanıcı bilgilerini al
        return (user.name, user.age); // İsim ve yaş bilgisini döndür
    }
}