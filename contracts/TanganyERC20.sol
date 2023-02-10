// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title 
 */
contract TanganyERC20 is ERC20 {
    // token name
    string public constant NAME = "TEST1
    // token symbol
    string public constant SYMBOL = "TESTRIX"
    // token decimals
    uint8 public constant DECIMALS = 18;
    // initial token supply
    uint256 public constant INITIAL_SUPPLY = 10000000000 * (10 ** uint256(DECIMALS)); // 10000000000 tokens

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () ERC20(NAME, SYMBOL) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function decimals() public pure override returns (uint8) {
        return DECIMALS;
    }
}
