pragma solidity ^0.4.19;

import "./Ownable.sol";

contract AquariumGarden is Ownable {
    //  The Birth event is called whenever a new creature is created.
    event SeabyBirth(uint seabyId, string name);
    //  The TransferFinish is called when a transaction is over.
    event TransferFinish(address from, address to, uint256 seabyId);

    //  The data structure of Seaby
    struct Seaby {
      string name;
      uint16 generation;//?
      uint64 birthtime;
      // The coolddown for the next breeding
      uint siringCD;
      bool forSale;
      mapping (uint8 => uint16) features;//0-eyes. 1-mouth. 2-color 3-body
    }
    uint8 _numberOfFeatures = 4;
    Seaby[] public seabies;
    // A mapping from Seaby IDs to the address of owns them. Gen0 Seabies are created with a non-zero owner.
    mapping (uint => address) public SeabyToOwner;
    // A mapping from owner address to count of tokens that address owns.
    mapping (address => uint) ownerSeabyCount;

    mapping (uint => address) public seabyApprovals;
    
    function _getNumberOfFeatures() internal view returns(uint8) {
        return _numberOfFeatures;    
    }
    function _updateNumberOfFeatures(uint8 _newNumber) internal {
        _numberOfFeatures = _newNumber;
    }
    
    //  An internal method that creates a new Seaby and stores it. Will generate both a Birth event
    //  and a Transfer event.
    function _createSeaby(string _name, uint16 _generation, address _owner, uint16[] _features) internal {
        uint _siringCD = 1 days;
        
        Seaby memory _seaby = Seaby({
            name: _name,
            generation: _generation,
            birthtime: uint64(now),
            siringCD:  _siringCD,
            forSale: false
        });

        uint NewCBId = seabies.push(_seaby)-1;
        _setFeatures(NewCBId,_features);
        SeabyBirth(NewCBId, _name);
        _transfer(0,_owner,NewCBId);
    }
    function _setFeatures(uint _seabyId, uint16[] _features) internal{
        Seaby storage _seaby = seabies[_seabyId];
        for (uint8 i = 0; i < _features.length; i++){
            _seaby.features[i] = _features[i];
        }
    }
    // A return function that will generate a random style by a feature index and return style of feature
    function _generateRandomFeatures() internal view returns (uint16) {
        // uint rand = uint(keccak256(_str));
        uint8 randNonce = 3;//should be a seed of random number
        uint random = uint(keccak256(now, msg.sender, randNonce)) % 100;//0-100 random number
        if (random <= 33){
            return 1;
        }
        else if(random > 33 && random <= 67) {
            return 2;
        }
        else{
            return 3;
        }
    }
    // A return function that will generate a new Seaby by calling _createSeaby function and return an array of features
    function createRandomSeaby(string _name) public {
        //require(ownerSeabyCount[msg.sender] == 0);
        address _owner = msg.sender;
        // int size = 4;
        uint16[] memory _randFeatures = new uint16[](_numberOfFeatures); 
        for(uint i = 0; i < _numberOfFeatures; i++){
            _randFeatures[i] = _generateRandomFeatures();
        }
        _createSeaby(_name, 0, _owner, _randFeatures);
    }
    // A internal function that can transfer a Seaby from one to other and generate a TransferFinish event.
    function _transfer(address _from, address _to, uint256 _seabyId) internal{
        ownerSeabyCount[_to]++;
        SeabyToOwner[_seabyId] = _to;
        if(_from != address(0)){
            ownerSeabyCount[_from]--;
        }
        TransferFinish(_from,_to,_seabyId);
    }
}
