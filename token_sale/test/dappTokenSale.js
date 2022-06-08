const DappToken = artifacts.require('DappToken');
const DappTokenSale = artifacts.require('DappTokenSale');

contract("DappTokenSale", (accounts) => {
    let dappTokenSale;
    let dappToken;
    let admin = accounts[0];
    let buyer = accounts[1];
    const tokenPrice = 1_000_000_000_000_000;// 10^15 wei or 0.001 ether
    let tokensAvailable = 750000 // 75% of total

    before(async () => {
        dappToken = await DappToken.deployed();
        dappTokenSale = await DappTokenSale.deployed();
        //provision 75% of all tokens to the token sale.
        await dappToken.transfer(dappTokenSale.address, tokensAvailable, { from : admin });
    });

    it("initializes the contract with the correct values", async () => {
        const tokenContractAddress = await dappTokenSale.tokenContract.call();
        assert.notEqual(tokenContractAddress, 0x0, 'has token contract address');
        const tokenPrice = await dappTokenSale.tokenPrice();
        assert.equal(tokenPrice, 1_000_000_000_000_000,'token price is correct');
    });

    it("facilitates token buying", async () => {
        let numberOfTokens = 10;
        const result = await dappTokenSale.buyTokens(numberOfTokens, { from : buyer, value : numberOfTokens * tokenPrice})
        assert.equal(result.receipt.status, true, 'can buy tokens');
        assert.equal(result.receipt.logs.length, 1, 'triggers one event');
        assert.equal(result.receipt.logs[0].event, 'Sell', 'should trigger Sell event');
        assert.equal(result.receipt.logs[0].args._buyer, buyer, 'logs the account that purchased the tokens');
        assert.equal(result.receipt.logs[0].args._amount, numberOfTokens, 'logs the number of tokens purchased');
        const tokensSold = (await dappTokenSale.tokensSold()).toNumber();
        assert.equal(tokensSold, numberOfTokens,'increments the number of tokens sold');
    });
})