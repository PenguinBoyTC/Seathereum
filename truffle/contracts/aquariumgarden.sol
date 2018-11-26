pragma solidity ^0.4.19;

import "./ownable.sol";

contract AquariumGarden is Ownable {

    event SeabyBirth(uint seabyId, string name, uint dna);
    event TransferFinish(address from, address to, uint256 tokenId);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Seaby {
      string name;
      uint dna;
      uint16 generation;
      uint64 birthtime;
      uint siringCD;
    }
    Seaby[] public seabies;
    mapping (uint => address) public SeabyToOwner;
    mapping (address => uint) ownerSeabyCount;

    function _createSeaby(string _name, uint _dna, uint16 _generation, address _owner) internal {
        uint _siringCD = 1 days;

        Seaby memory _seaby = Seaby({
            name: _name,
            dna: _dna,
            generation: _generation,
            birthtime: uint64(now),
            siringCD:  _siringCD
        });
        uint NewCBId = seabies.push(_seaby)-1;
        SeabyToOwner[NewCBId] = msg.sender;
        ownerSeabyCount[msg.sender]++;
        SeabyBirth(NewCBId, _name, _dna);
        _transfer(0,_owner,NewCBId);

    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomSeaby(string _name) public {
        require(ownerSeabyCount[msg.sender] == 0);
        uint m_Dna = _generateRandomDna(_name);
        m_Dna = m_Dna - m_Dna % 100;
        address _owner = msg.sender;
        _createSeaby(_name, m_Dna, 0, _owner);
    }
    function _transfer(address _from, address _to, uint256 _tokenId) internal{
        ownerSeabyCount[_to]++;
        SeabyToOwner[_tokenId] = _to;
        if(_from != address(0)){
            ownerSeabyCount[_from]--;
        }
        TransferFinish(_from,_to,_tokenId);
    }

}
