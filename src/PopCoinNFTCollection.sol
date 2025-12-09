// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Strings} from "../lib/openzeppelin-contracts/contracts/utils/Strings.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract PopCoinNFTCollection is ERC721{
    using Strings for uint256;

    uint256 public currentTokenId;
    uint256 public totalSupply;
    string public baseUri;

    event MintNFT(address userAddress, uint256 tokenId);

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply, string memory _baseUri) ERC721(_name, _symbol){
        totalSupply = _totalSupply;
        baseUri = _baseUri;
    }

    function mint() external {
        require(currentTokenId < totalSupply, "Sold out");
        address userAddress = msg.sender;
        uint256 tokenId = currentTokenId;
        _safeMint(userAddress, tokenId);
        currentTokenId++;
        emit MintNFT(userAddress, tokenId);
    }

    function tokenURI(uint256 tokenId) public override view virtual returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString(),".json") : "";
    }

    function _baseURI() internal override view virtual returns (string memory) {
        return baseUri;
    }

}

