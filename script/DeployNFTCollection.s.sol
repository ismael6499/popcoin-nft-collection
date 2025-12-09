// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {PopCoinNFTCollection} from "../src/PopCoinNFTCollection.sol";

contract DeployNFTCollection is Script {

    function run() external returns (PopCoinNFTCollection) {
        uint256 deployPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployPrivateKey);

        string memory _name = "PopCoin NFT Collection";
        string memory _symbol = "POPCNFT";
        uint256 totalSupply = 3;
        string memory _baseUri = "ipfs://bafybeif33e2p4otvcjt2ljvguyus54s2bsq66av7pjcey73lmdian5pwhu/";
        PopCoinNFTCollection nftCollection = new PopCoinNFTCollection( _name, _symbol, totalSupply, _baseUri);        

        vm.stopBroadcast();
        return nftCollection;
    }
}