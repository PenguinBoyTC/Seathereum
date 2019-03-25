pragma solidity ^0.5.0;

import "./AquariumGarden.sol";
// import "./ERC721.sol";
//import "../../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol"

contract Ownership is AquariumGarden {

    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return ownerSeabyCount[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return SeabyToOwner[_tokenId];
    }
    // transfer the given Seaby to others
    function transfer(address _to, uint256 _tokenId) public {
        require(_to != address(0));
        require(_to != address(this));
        // require(_to != address(saleAuction));
        // require(_to != address(siringAuction));
        require(_isOwns(msg.sender, _tokenId));
        require(isForSale(_tokenId));
        _transfer(msg.sender, _to, _tokenId);
    }

    function approve(address _to, uint256 _tokenId) public {
        require(_isOwns(msg.sender, _tokenId));
        seabyApprovals[_tokenId] = _to;
        emit Approval(msg.sender, _to, _tokenId);
    }

    function takeOwnership(uint256 _tokenId) public {
        require(seabyApprovals[_tokenId] == msg.sender);
        address _owner = ownerOf(_tokenId);
        _transfer(_owner, msg.sender, _tokenId);
    }

    //An internal function that will make sure if sender has a Seaby with the given id.
    function _isOwns(address _sender, uint256 _tokenId) internal view returns (bool) {
        return SeabyToOwner[_tokenId] == _sender;
    }
    function isForSale(uint256 _tokenId) public view returns (bool){
        return seabies[_tokenId].forSale;
    }
    function totalSeaby() public view returns (uint){
        return seabies.length - 1;
    }
}