pragma solidity ^0.4.19;

import "./AquariumGarden.sol";
import "./ERC721.sol";

contract Ownership is AquariumGarden, ERC721 {
    // ERC721Metadata public erc721Metadata;


    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return ownerSeabyCount[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return SeabyToOwner[_tokenId];
    }

    function transfer(address _to, uint256 _tokenId) public {
        require(_to != address(0));
        require(_to != address(this));
        // require(_to != address(saleAuction));
        // require(_to != address(siringAuction));
        require(_isOwns(msg.sender, _tokenId));
        _transfe(msg.sender, _to, _tokenId);
    }

    function approve(address _to, uint256 _tokenId) public {
        require(_isOwns(msg.sender, _tokenId));
        seabyApprovals[_tokenId] = _to;
        Approval(msg.sender, _to, _tokenId);
    }

    function takeOwnership(uint256 _tokenId) public {
        require(seabyApprovals[_tokenId] == msg.sender);
        address _owner = ownerOf(_tokenId);
        _transfer(_owner, msg.sender, _tokenId);
    }
    //
    function _isOwns(address _sender, uint256 _tokenId) internal view returns (bool) {
        return SeabyToOwner[_tokenId] == _sender;
    }
}