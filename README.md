# ERC-1155 NFT Collection Tutorial: Create Your Own POAP-style Tokens

## Overview
This tutorial guides you through creating and deploying an ERC-1155 NFT collection that can be used similar to POAPs (Proof of Attendance Protocol). These NFTs can be distributed to participants as digital proof of participation in events, completion of tasks, or other achievements.

## What is ERC-1155 and Why Use It?
ERC-1155 is a token standard that allows for both fungible and non-fungible tokens in a single smart contract. It's ideal for POAP-style distributions because:
- Multiple tokens can be managed in one contract
- Batch minting and transfers are supported
- Gas efficient for multiple token operations
- Perfect for creating multiple editions of the same NFT

## Prerequisites
- Basic understanding of blockchain and NFTs
- A crypto wallet (e.g. Metamask)
- Some test network tokens (for testnet deployment)

## Required Tools

> **Note**: The tools listed below are selected for their ease of use and clarity in demonstrating core concepts. While they work well for this tutorial, there are many other excellent alternatives available in the ecosystem. Feel free to substitute them with tools that better suit your specific needs and preferences.

### Core Infrastructure
- **NFT Standard**: [ERC-1155](https://ethereum.org/en/developers/docs/standards/tokens/erc-1155/)
- **Smart Contract Framework**: [OpenZeppelin](https://docs.openzeppelin.com/contracts/5.x/erc1155)
- **RPC Provider**: [Alchemy](https://www.alchemy.com/)
- **Wallet**: [Metamask](https://metamask.io/)

### Development Tools
- **Smart Contract IDE**: [Remix](https://remix.ethereum.org/)
- **Smart Contract Generator**: [OpenZeppelin Wizard](https://wizard.openzeppelin.com/#erc1155)
- **NFT Design Tool**: [Canva](https://www.canva.com/)
- **IPFS Storage**: [Pinata](https://pinata.cloud/)
- **Distribution Form**: [DeForm](https://app.deform.cc/)

## Step-by-Step Guide

### 1. Setup Infrastructure
1. Create an Alchemy account and set up an app
   - Sign up at Alchemy
   - Create a new app and select your desired chain
   - Copy your RPC URL

2. Configure your wallet
   - Add the network to Metamask using Alchemy RPC
   - Ensure you have enough funds for deployment
   - Keep your private keys secure!

### 2. Smart Contract Development
1. Access [Remix IDE](https://remix.ethereum.org/)
2. Create a new project
3. Use OpenZeppelin Wizard or this project code example to generate your ERC-1155 contract
4. Customize the contract
5. Compile the contract
6. Deploy using Injected Provider (Metamask)
   - Verify correct network and account
   - Save the deployed contract address

### 3. Create NFT Assets
1. Design your NFT artwork
   - Create image/video using Canva or your preferred tool

2. Prepare metadata
   - Follow [OpenSea Metadata Standards](https://docs.opensea.io/docs/metadata-standards)
   - Use the `metadata.json` example in this repository as a template or create your own
   - Include all required fields (name, description, image, etc.)

3. Upload to IPFS
   - Upload artwork to Pinata, save the CID
   - Update metadata with correct CIDs
   - Upload metadata to Pinata, save the metadata CID

### 4. NFT Minting
1. In Remix, connect to your deployed contract
2. Set the Token URI: `setTokenUri(tokenId, "ipfs://<metadata_CID>")`
3. Test mint: `mint(recipient_address, tokenId, amount, "0x")`
4. Verify on:
   - [OpenSea](https://opensea.io/) (testnet/mainnet)
   - [Etherscan](https://etherscan.io/)

### 5. Expanding Your Collection
1. Continue minting existing NFTs
   - Use the mint function to distribute NFTs to different addresses
   - You can mint multiple NFTs to the same address
   - Keep track of which addresses received which tokenIds

2. Create new NFTs in the collection
   - For each new NFT design, repeat steps from "Create NFT Assets"
   - Use a new unique tokenId for each design
   - Create new metadata and artwork
   - Upload to IPFS and set the new TokenURI
   - Start minting the new design










