// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract AUSBNFT is ERC1155, Ownable, ERC1155Pausable, ERC1155Supply {
    string public name = "My Cool NFT Collection";
    mapping(uint256 => string) private _tokenURIs;

    constructor(address initialOwner) ERC1155("My Own NFT") Ownable(initialOwner) {}

    function setTokenURI(uint256 tokenId, string memory tokenURI) public onlyOwner {
        _tokenURIs[tokenId] = tokenURI;
    }

    function uri(uint256 tokenId) public view override returns (string memory) {
        require(bytes(_tokenURIs[tokenId]).length > 0, "URI not set for token");
        return _tokenURIs[tokenId];
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // Override public transfer functions to prevent transferring tokens
    function safeTransferFrom(address from, address /* to */, uint256 /* id */, uint256 /* amount */, bytes memory /* data */)
        public
        virtual
        override
        whenNotPaused
    {
        require(from == address(0), "This Token cannot be transferred");
    }

    function safeBatchTransferFrom(address from, address /* to */, uint256[] memory /* ids */, uint256[] memory /* amounts */, bytes memory /* data */)
        public
        virtual
        override
        whenNotPaused
    {
        require(from == address(0), "This Token cannot be transferred");
    }


    // The following functions are overrides required by Solidity.
    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155, ERC1155Pausable, ERC1155Supply)
    {
        super._update(from, to, ids, values);
    }
}
