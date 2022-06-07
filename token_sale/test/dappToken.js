const DappToken = artifacts.require("DappToken");

contract("DappToken", (accounts) => {
    let dappToken;

    before(async () => {
        dappToken = await DappToken.deployed();
    });

    it("sets the total supply upon deployment", async () => {
        const totalSupply = await dappToken.totalSupply.call();
        assert.equal(totalSupply.toNumber(), 1_000_000, "Initial total supply should be 1,000,000");
    });

    it("it allocates the initial supply to admin account", async () => {
        const adminBalance = (await dappToken.balanceOf.call(accounts[0])).toNumber();
        assert.equal(adminBalance, 1_000_000,"adminBalance should be equal to 1,000,000")
    })


})