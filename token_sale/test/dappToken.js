const DappToken = artifacts.require("DappToken");

contract("DappToken", (accounts) => {
    let dappToken;

    before(async () => {
        dappToken = await DappToken.deployed();
    });

    it("sets the total supply upon deployment", async () => {
        const totalSupply = await dappToken.totalSupply.call();
        assert.equal(totalSupply.toNumber(), 1000000, "Initial total supply should be 1,000,000");
    })
})