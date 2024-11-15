// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // uint türünde bir state değişkeni tanımlıyoruz
    uint256 private storedNumber;

    // Sayıyı güncellemek için bir fonksiyon
    function setNumber(uint256 _number) public {
        storedNumber = _number;
    }

    // Kaydedilen sayıyı okumak için bir fonksiyon
    function getNumber() public view returns (uint256) {
        return storedNumber;
    }
}
