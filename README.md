# Gen Contract

Create and deploy a Gen Contract to Ethereum

## Install Truffle and Ganache
```
brew install truffle
```
or
```
npm install truffle
```

If this is the first time you are writing a smart contract, you will need to set up your environment. We are going to use two tools: [Truffle](https://www.trufflesuite.com/) and [Ganache](https://www.trufflesuite.com/ganache).

Truffle is a development environment and testing framework for developing smart contracts for Ethereum. With Truffle it is easy to build and deploy smart contracts to the blockchain. Ganache allow us to create a local Ethereum blockchain in order to test smart contracts. It simulates the features of the real network and the first 10 accounts are funded with 100 test Ether, thus making the smart contract deployment and testing free and easy. Ganache is available as a desktop application and a command-line tool. For this article we will be using the UI desktop application.

![Ganache UI desktop application](https://cdn-images-1.medium.com/max/2360/1*V1iQ5onbLbT5Ib2QaiOSyg.png)*Ganache UI desktop application*

To create the project, run the following commands

```Powershell
mkdir YourProjectName
cd YourProjectName
truffle init
```

This will create a blank project for the development and deployment of our smart contracts. The created project structure is the following:

* `contracts`: Folder for the solidity smart contracts

* `migrations`: Folder for the deployment scripts

* `test`: Folder for testing our smart contracts

* `truffle-config.js`: Truffle configuration file

## Update Solidity Version

To compile our smart contract, we must first check our solidity compiler version. You can check that by running the command:

```
truffle version
```

The default version is the `Solidity v0.5.16`. Since our token is written using the solidity version `0.8.10`, if we run the command to compile our contracts we will get a compiler error. In order to specify which solidity compiler version to use, go to the file `truffle-config.js` and set to the desired compiler version as seen below:

```javascript
// Configure your compilers
compilers: {
  solc: {
    version: "0.8.10",    // Fetch exact version from solc-bin (default: truffle's version)
    // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
    // settings: {          // See the solidity docs for advice about optimization and evmVersion
    //  optimizer: {
    //    enabled: false,
    //    runs: 200
    //  },
    //  evmVersion: "byzantium"
    // }
  }
}
```

## Deploy Gen Contract

```javascript
var GenContract = artifacts.require("GenContract");

module.exports = function(deployer) {
  deployer.deploy(GenContract);
};
```

Now we can compile our smart contract by running the following command:

```
truffle compile
```

After compiling, we can now deploy our token. For this open Ganache and select the option "Quickstart" to start a local Ethereum blockchain. To deploy our contract, run:

```
truffle migrate
```

The address used to deploy our contracts is the first one from the list of addresses that Ganache shows us. To verify that, we can open the Ganache desktop application and we can verify that the balance of Ether for the first account has been reduced due to the cost of Ether to deploy our smart contracts:

![Ganache desktop application](https://cdn-images-1.medium.com/max/2346/1*1iJ9VRlyLuza58HL3DLfpg.png)*Ganache desktop application*

To verify that 1 million MyToken tokens have been sent to the deployer address, we can use the Truffle Console to interact with our deployed smart contract.
> [Truffle Console is a a basic interactive console connecting to any Ethereum client.](https://www.trufflesuite.com/docs/truffle/getting-started/using-truffle-develop-and-the-console)

In order to interact with our smart contract, run the following command:

```
truffle console
```

## References

[Contracts - OpenZeppelin Docs](https://docs.openzeppelin.com/contracts/3.x/)

[Sweet Tools for Smart Contracts | Truffle Suite](https://www.trufflesuite.com/)

[Ganache | Truffle Suite](https://www.trufflesuite.com/ganache)