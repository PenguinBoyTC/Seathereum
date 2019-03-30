pragma solidity ^0.5.0;

import "./Ownership.sol";


contract SeabyBreeding is Ownership {
    //  When two Seabies successfully breed and the pregnancy
    //  timer begins to count. 
    event Pregnant(address indexed owner);
    modifier requireOwnerOf(uint _seabyId) {
        require(msg.sender == SeabyToOwner[_seabyId]);
        _;
    }

    uint256 public BirthFee = 2 finney;
    // function _isReadyToBreed(Seaby memory _seaby) internal view returns (bool) {
    //     return true;
    // }
    function _isReadyToGiveBirth(Seaby memory _momSeaby) private view returns (bool) {
        return true;
    }
    // function isReadyToBreed(uint _seabyId) public view returns (bool) {
    //     require(_seabyId > 0);
    //     Seaby storage seaby = seabies[_seabyId];
    //     return _isReadyToBreed(seaby);
    // }
    function requestBreedWith(uint _mySeabyId, uint _toSeabyId) external payable requireOwnerOf(_mySeabyId) {
        require(msg.value >= BirthFee);
        require(msg.sender == seabyAllowedBreedToAddress[_toSeabyId]);
        _breedWith(_mySeabyId, _toSeabyId);
    }
    function _breedWith(uint _momSeabyId, uint _dadSeabyId) internal {
        Seaby storage momSeaby = seabies[_momSeabyId];
        Seaby storage dadSeaby = seabies[_dadSeabyId];
        momSeaby.siringPartnerID = _dadSeabyId;
        seabyAllowedBreedToAddress[_momSeabyId];
        seabyAllowedBreedToAddress[_dadSeabyId];
    }
    function beBorn(uint _momSeabyId) external {
        Seaby storage momSeaby = seabies[_momSeabyId];
        require(momSeaby.birthTime != 0);
        require(_isReadyToGiveBirth(momSeaby));
        uint dadSeabyId = momSeaby.siringPartnerID;
        Seaby storage dadSeaby = seabies[dadSeabyId];
        uint16 maxGeneration = momSeaby.generation;
        if (dadSeaby.generation > maxGeneration) {
            maxGeneration = dadSeaby.generation;
        }
        string memory babyName = "Baby";
        uint16[] memory babyFeatures = new uint16[](_numberOfFeatures);
        delete momSeaby.siringPartnerID;
        msg.sender.send(BirthFee);
        _createSeaby(babyName, maxGeneration + 1, msg.sender, babyFeatures);
    }
    function approveToBreedWith(uint _seabyId, address _to) external requireOwnerOf(_seabyId) {
        seabyAllowedBreedToAddress[_seabyId] = _to;
    }

    function changeName(uint _seabyId, string calldata _newName) external requireOwnerOf(_seabyId) {
        seabies[_seabyId].name = _newName;
    }
    function changeForSaleStatus(uint _seabyId) external requireOwnerOf(_seabyId) {
        seabies[_seabyId].forSale = !seabies[_seabyId].forSale;
    }
    function getSeabiesByOwner(address _owner) external view returns(uint[] memory) {
        uint[] memory allSeabies = new uint[](ownerSeabyCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < seabies.length; i++) {
            if (SeabyToOwner[i] == _owner) {
                allSeabies[counter++] = i;
            }
        }
        return allSeabies;
    }
    // function withdraw() external onlyOwner {
    //     owner.transfer(address(this).balance);
    // }

}
