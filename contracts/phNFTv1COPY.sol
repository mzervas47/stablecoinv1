//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract phNFTv1 is ERC721, Ownable {
    uint256 private _nextTokenId;
    uint256 public constant MINT_PRICE = 0.001 ether;
    mapping(uint256 => string) private _tokenURIs;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) Ownable(msg.sender) {}

    function mint(string memory tokenURI_) public payable {
        require(msg.value >= MINT_PRICE, "Not enough ETH sent");
        require(bytes(tokenURI_).length > 0, "Invalid Metadata");

        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        _tokenURIs[tokenId] = tokenURI_;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(ownerOf(tokenId) != address(0), "ERC721 Metadata: URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }

    function withdraw(address payable recipient) public onlyOwner {
        recipient.transfer(address(this).balance);
    }
}



