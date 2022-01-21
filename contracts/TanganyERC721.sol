// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

/**
 * @title TanganyERC721
 * @dev Simple ERC721 Token example yields a non-fungible token pre-assigned to its creator.
 */
contract TanganyERC721 is ERC721Enumerable, Ownable {
    // modify token name
    string public constant NAME = "TanganyERC721";
    // modify token symbol
    string public constant SYMBOL = "TERC721";

    /**
     * @dev Constructor that gives msg.sender the non-fungible token.
     */
    constructor () ERC721(NAME, SYMBOL) {
        _mint(msg.sender, totalSupply() + 1);
    }

    function mint(address to) public onlyOwner {
        _mint(to, totalSupply() + 1);
    }
}