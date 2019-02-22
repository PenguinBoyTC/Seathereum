pragma solidity ^0.4.19;

import "./Ownership.sol";


contract SeabyBreeding is Ownership {
    //  When two Seabies successfully breed and the pregnancy
    //  timer begins to count. 
    event Pregnant(address owner);
    modifier requireOwnerOf(uint _seabyId) {
        require(msg.sender == SeabyToOwner[_seabyId]);
        _;
    }
    function _isReadyToBreed(Seaby _seaby) internal view returns (bool) {
        return true;
    }
    function _isReadyToGiveBirth(Seaby _mom) private view returns (bool) {
        return true;
    }
    function isReadyToBreed(uint _seabyId) public view returns (bool) {
        require(_seabyId > 0);
        Seaby storage seaby = seabies[_seabyId];
        return _isReadyToBreed(seaby);
    }
    function changeName(uint _seabyId, string _newName) external requireOwnerOf(_seabyId) {
        require(msg.sender == SeabyToOwner[_seabyId]);
        seabies[_seabyId].name = _newName;
    }
    function changeForSaleStatus(uint _seabyId) external requireOwnerOf(_seabyId) {
        require(msg.sender == SeabyToOwner[_seabyId]);
        seabies[_seabyId].forSale = !seabies[_seabyId].forSale;
    }
    function getSeabiesByOwner(address _owner) external view returns(uint[]) {
        uint[] memory allSeabies = new uint[](ownerSeabyCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < allSeabies.length; i++) {
            if (SeabyToOwner[i] == _owner) {
                allSeabies[counter++] = i;
            }
        }
        return allSeabies;
    }
    function withdraw() external onlyOwner {
        owner.transfer(this.balance);
    }

}
