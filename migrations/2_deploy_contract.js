var GenContract = artifacts.require("GenContract");
const GenDevToken = artifacts.require('GenDevToken');

module.exports = async function(deployer) {
  deployer.deploy(GenContract);
  await deployer.deploy(GenDevToken, 'Generation dev', 'GEN', '10000000000000000000000');
};