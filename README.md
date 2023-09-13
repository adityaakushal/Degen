# Degen Token(in-game store)

We have deployed the in-game store contract to the avalanche fuji testnet.

## Description

In this project, we have deployed the contract first to the avalanche testnet in gitpod (check the next section for the commands) . The contract contains an in-game store which as three items which can be redeemed. The contract is also verified on snowtrace which is shown in the video uploaded. We have to connect our remix ide to metamask and confirm transactions in order to call a function .

## Getting Started

### Installing

* You can download the zip file and run it locally or on gitpod which is much easier.
* No modifications to be made here

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenToken.sol). Copy and paste the following code into the file:

```javascript
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" (or another compatible version), and then click on the "Compile DegenToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" contract from the dropdown menu, and then click on the "Deploy" button.
Before you click on deploy , you need to change the environment to injected provider-metamask and connect your account which has AVAX tokens in it.

In order to verify the contract , run this command:
```
npx hardhat verify {contract_address} --network --fuji
```


## Help

If you face any transaction related error or insufficient avax tokens for gas fees , you can get more AVAX tokens here:
```
https://core.app/tools/testnet-faucet/?subnet=c&token=c
```

## Authors

Aditya K

@adityaaakushal@gmail.com


## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
