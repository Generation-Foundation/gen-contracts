var GenContract = artifacts.require("GenContract");

module.exports = function(deployer) {
  // Arguments are: contract
  deployer.deploy(GenContract);
};