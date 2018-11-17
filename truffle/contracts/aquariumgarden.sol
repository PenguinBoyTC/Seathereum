pragma solidity ^0.4.19;

import "./ownable.sol";

contract AquariumGarden is Ownable {

    event NewSeaby(uint seabyId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;

    struct Seaby {
      string name;
      uint dna;
      uint16 generation;
      uint64 birthtime;
    //   uint32 readyTime;
    }

    Seaby[] public seabies;
    mapping (uint => address) public SeabyToOwner;
    mapping (address => uint) ownerSeabyCount;

    function _createSeaby(string _name, uint _dna) internal {
        uint id = seabies.push(Seaby(_name, _dna, 0, uint64(now)));
        SeabyToOwner[id] = msg.sender;
        ownerSeabyCount[msg.sender]++;
        NewSeaby(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomSeaby(string _name) public {
        //require(ownerSeabyCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        randDna = randDna - randDna % 100;
        _createSeaby(_name, randDna);
    }
    function _transfer(address _from, address _to, uint256 _tokenId) internal {

    }

}
