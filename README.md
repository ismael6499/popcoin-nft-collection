# 🎨 PopCoin NFT: IPFS-Backed Digital Assets

![Solidity](https://img.shields.io/badge/Solidity-0.8.24-363636?style=flat-square&logo=solidity)
![Network](https://img.shields.io/badge/Network-Arbitrum_One-blue?style=flat-square&logo=arbitrum)
![Storage](https://img.shields.io/badge/Storage-IPFS_Immutable-65c2cb?style=flat-square&logo=ipfs)

A decentralized ERC-721 implementation architected for **metadata immutability** and **Layer 2 scalability**.

Deployed on **Arbitrum One**, this protocol eliminates the single points of failure found in traditional Web2-hosted NFTs. Instead of relying on centralized servers (e.g., AWS S3) which allow for metadata tampering or link rot, this architecture resolves asset pointers securely to the **InterPlanetary File System (IPFS)**, ensuring that ownership represents a permanent digital artifact.

## 🏗 Architecture & Design Decisions

### 1. Immutable Metadata Resolution
- **Decentralized Storage Integration:**
  - The contract implements a dynamic URI construction pattern (`baseUri + tokenId + ".json"`) specifically designed to resolve to Content Identifiers (CIDs) on IPFS.
  - **Technical Benefit:** This guarantees that the visual representation and attributes of the asset cannot be altered or censored by the contract owner after deployment, adhering to the "Code is Law" principle of true ownership.

### 2. Supply Mechanics
- **Hard-Capped Scarcity:**
  - Implements a strict `totalSupply` check during the minting process (`require(currentTokenId < totalSupply)`). unlike infinite-mint contracts, this enforces digital scarcity at the protocol level.
  - **Sequential Minting:** Utilizes a linear ID generation strategy to ensure predictable metadata assignment and simplify off-chain indexing.

### 3. Layer 2 Optimization
- **Arbitrum Deployment:**
  - Engineered for the Arbitrum Rollup ecosystem to minimize minting and transfer costs while inheriting Ethereum's Layer 1 security finality.
  - **Gas Efficiency:** Leverages OpenZeppelin's `Strings` library for optimized on-chain string operations during URI concatenation.

## 🛠 Tech Stack

* **Core:** Solidity `^0.8.24`
* **Standard:** ERC-721 (OpenZeppelin)
* **Storage:** IPFS (Pinned Metadata)
* **Network:** Arbitrum One (L2)

## 📝 Contract Interface

The system utilizes on-chain logic to resolve decentralized pointers:

```solidity
// Dynamic IPFS resolution
function tokenURI(uint256 tokenId) public view override returns (string memory) {
    _requireOwned(tokenId);
    string memory baseURI = _baseURI();
    // Concatenates base IPFS CID with Token ID
    return bytes(baseURI).length > 0 
        ? string.concat(baseURI, tokenId.toString(), ".json") 
        : "";
}
