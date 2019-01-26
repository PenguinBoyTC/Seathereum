pragma solidity ^0.4.19;

import "./Ownership.sol";


contract SeabyBreeding is Ownership {
    //  When two Seabies successfully breed and the pregnancy
    //  timer begins to count. 
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
