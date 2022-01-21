// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";
import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract TanganyLoveToken is ERC20PresetMinterPauser {
    using SafeMath for uint256;

    constructor() ERC20PresetMinterPauser("TanganyLoveToken", "TLT") {}

    function mint(address to, uint256 amount) public virtual override {
        _mint(to, amount * 1e18);
    }
}