// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    string public ingame;

    constructor() ERC20("Degen", "DGN") {
        ingame = "We have the following items in our shop: 1.OFFICIAL DEGEN perfume 2.OFFICIAL DEGEN Jacket 3.OFFICIAL DEGEN tie  ";
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function redeem(uint256 itmno) public {
        require(itmno <= 3, "Invalid item number");
        if (balanceOf(msg.sender) < 500) {
            revert("Minimum tokens required to redeem atleast one item is 500");
        }

        _burn(msg.sender, itmno * 500);
    }
}
