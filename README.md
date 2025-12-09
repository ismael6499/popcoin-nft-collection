# 🎨 PopCoin NFT Collection: ERC-721 on Arbitrum & IPFS

A fully decentralized NFT implementation deployed on the **Arbitrum One** network, architected to ensure true asset ownership through immutable metadata storage and gas-efficient execution.

## 🚀 Engineering Context

As a **Java Software Engineer**, I am accustomed to architecture where asset pointers rely on centralized object storage (like AWS S3). In this project, I challenged that paradigm by implementing **Decentralized Storage** using **IPFS**.

The goal was to engineer a solution where metadata and images are mathematically immutable and uncensorable, removing the single point of failure typical in Web2 architectures while leveraging Layer 2 scaling solutions.

## 💡 Project Overview

**PopCoin NFT** is an ERC-721 compliant collection with a limited supply. Unlike standard implementations that might rely on centralized APIs for metadata, this contract contains on-chain logic to resolve dynamic URIs pointing to a decentralized file system.

### 🔍 Key Technical Features:

* **Decentralized Storage (IPFS):**
    * **Architecture:** Images and JSON metadata are hosted on IPFS (InterPlanetary File System) to ensure data persistence independent of any central server.
    * **Resolution Logic:** The contract stores the `baseUri` (`ipfs://.../`), and the `tokenURI` function dynamically concatenates the Token ID to resolve the specific metadata file (e.g., `1.json`).

* **Arbitrum Deployment (Layer 2):**
    * Deployed to **Arbitrum One** to leverage significantly lower gas fees while inheriting Ethereum's L1 security guarantees.
    * Source code verified on Arbiscan for transparency.

* **Metadata Construction:**
    * Implementation of the `Strings` library from OpenZeppelin to convert `uint256` into string literals for URI concatenation.
    * **Pattern:** `return baseUri + tokenId + ".json"`.

## 🛠️ Stack & Tools

* **Standard:** ERC-721 (OpenZeppelin).
* **Storage:** IPFS (InterPlanetary File System).
* **Network:** Arbitrum One.
* **Tooling:** Foundry.
    * *Chosen for its Solidity-native testing capabilities and faster compilation times compared to JavaScript-based frameworks.*

---

## 🌐 Live Deployment

* **Verified Contract:** [View on Arbiscan](https://arbiscan.io/address/0xd068673a424a8d90e9c34ccce03c1854547ddb7f#code)
* **Collection:** [View on OpenSea](https://opensea.io/collection/popcoin-nft-collection)

---

*This project is part of my specialized portfolio in Blockchain Architecture.*