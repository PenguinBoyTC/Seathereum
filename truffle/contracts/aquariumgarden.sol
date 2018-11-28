pragma solidity ^0.4.19;

import "./ownable.sol";

contract AquariumGarden is Ownable {
    //  The Birth event is called whenever a new creature is created.
    event SeabyBirth(uint seabyId, string name, uint dna);
    //  The TransferFinish is called when a transaction is over.
    event TransferFinish(address from, address to, uint256 tokenId);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    //  The data structure of Seaby
    struct Seaby {
      string name;
      uint dna;
      uint16 generation;
      uint64 birthtime;
      // The coolddown for the next breeding
      uint siringCD;
    }
    Seaby[] public seabies;
    // A mapping from Seaby IDs to the address of owns them. Gen0 Seabies are created with a non-zero owner.
    mapping (uint => address) public SeabyToOwner;
    // A mapping from owner address to count of tokens that address owns.
    mapping (address => uint) ownerSeabyCount;
    //  An internal method that creates a new Seaby and stores it. Will generate both a Birth event
    //  and a Transfer event.
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
    // A return function that will generate a random DNA sequence by a string and return DNA
    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }
    // A return function that will generate a new Seaby by calling _createSeaby function and return its DNA sequence
    function createRandomSeaby(string _name) public returns (uint){
        require(ownerSeabyCount[msg.sender] == 0);
        uint m_Dna = _generateRandomDna(_name);
        m_Dna = m_Dna - m_Dna % 100;
        address _owner = msg.sender;
        _createSeaby(_name, m_Dna, 0, _owner);
        return m_Dna;
    }
    // A internal function that can transfer a Seaby from one to other and generate a TransferFinish event.
    function _transfer(address _from, address _to, uint256 _tokenId) internal{
        ownerSeabyCount[_to]++;
        SeabyToOwner[_tokenId] = _to;
        if(_from != address(0)){
            ownerSeabyCount[_from]--;
        }
        TransferFinish(_from,_to,_tokenId);
    }

}
