// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Amp is ERC1155, Ownable {
    uint256 constant tokenID = 0;

    constructor() ERC1155("") {
        _mint(msg.sender, tokenID, 1, "");
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, tokenID, amount, "");
    }
}
