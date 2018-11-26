pragma solidity ^0.4.19;

import "./ownership.sol";


contract SeabyBreeding is Ownership {
    event Pregnant(address owner);
    function _isReadyToBreed(Seaby _seaby) internal view returns (bool) {
        return true;
    }
    function _isReadyToGiveBirth(Seaby _mom) private view returns (bool) {
        return true;
    }
    function isReadyToBreed(uint256 _seabyId) public view returns (bool) {
        require(_seabyId > 0);
        Seaby storage seaby = seabies[_seabyId];
        return _isReadyToBreed(seaby);
    }

  
}
