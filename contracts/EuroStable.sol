//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EuroStable is ERC20, Ownable {
    uint8 private immutable _decimals;

    constructor() ERC20("EuroStable", "EURS") Ownable(msg.sender) {
        _decimals = 18;
        _mint(msg.sender, 1_000_000 * 10**uint256(_decimals));
    }

    function decimals() public view override returns(uint8) {
        return _decimals;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }
}

