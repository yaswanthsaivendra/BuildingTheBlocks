const DappToken = artifacts.require("DappToken");

contract("DappToken", (accounts) => {
    let dappToken;

    before(async () => {
        dappToken = await DappToken.deployed();
    });

    it("sets the initial total supply upon deployment", async () => {
        const totalSupply = await dappToken.totalSupply.call();
        assert.equal(totalSupply.toNumber(), 1_000_000, "Initial total supply should be 1,000,000");
    });

    it("it allocates the initial supply to admin account", async () => {
        const adminBalance = (await dappToken.balanceOf.call(accounts[0])).toNumber();
        assert.equal(adminBalance, 1_000_000,"adminBalance should be equal to 1,000,000")
    });

    it("intializes the contract with correct values", async () => {
        const name = await dappToken.name.call();
        const symbol = await dappToken.symbol.call();
        const standard = await dappToken.standard.call();
        assert.equal("DApp Token", name, "name should be DApp Token");
        assert.equal("DAPP", symbol, "symbol should be DAPP")
        assert.equal("DApp Token 1.0", standard, "standard should be DApp Token 1.0")
    });

    it("transfers token ownership", async () => {
        const result = await dappToken.transfer(accounts[1], 250000, { from : accounts[0]});
        const account0Balance = (await dappToken.balanceOf(accounts[0])).toNumber();
        const account1Balance = (await dappToken.balanceOf(accounts[1])).toNumber();
        assert.equal(result.receipt.status, true, "one should be able to transfer tokens");
        assert.equal(account0Balance, 750000, "balanceOf account[0] should be 750000");
        assert.equal(account1Balance, 250000, "balanceOf account[1] should be 250000");
        assert.equal(result.receipt.logs[0].event, "Transfer", "event should be Transfer");
        assert.equal(result.receipt.logs[0].args._from, accounts[0], "logs the _from account");
        assert.equal(result.receipt.logs[0].args._to, accounts[1], "logs the _to account");
        assert.equal(result.receipt.logs[0].args._value, 250000, "logs the _value - tokens to be transfered");
        const returnValue = await dappToken.transfer.call(accounts[1], 250000, { from : accounts[0]});
        assert.equal(returnValue, true, "return value should be true")
    });

})