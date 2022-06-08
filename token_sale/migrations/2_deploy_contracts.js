const DappToken = artifacts.require("DappToken");
const DappTokenSale = artifacts.require("DappTokenSale");

module.exports = function(deployer) {
  deployer.deploy(DappToken, 1_000_000).then(() => {
    let tokenPrice = 1_000_000_000_000_000;//0.001 in ether
    return deployer.deploy(DappTokenSale, DappToken.address, tokenPrice);
  })
};