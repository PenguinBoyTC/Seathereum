pragma solidity ^0.4.19;

import "./ownership.sol";


contract SeabyBreeding is Ownership {

  // function _triggerCooldown(Seaby storage _seaby) internal {
  //   _seaby.readyTime = uint32(now + cooldownTime);
  // }

  // function _isReady(Seaby storage _Seaby) internal view returns (bool) {
  //     return (_Seaby.readyTime <= now);
  // }

  function feedAndMultiply(uint _seabyId, uint _targetDna, string species) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Seaby storage mySeaby = seabies[_seabyId];
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (mySeaby.dna + _targetDna) / 2;
    _createSeaby("NoName", newDna);
  }
}
