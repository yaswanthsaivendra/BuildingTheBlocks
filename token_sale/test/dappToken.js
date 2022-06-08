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


    it("approves tokens for delegated transfer", async () => {
        const returnValue = await dappToken.approve.call(accounts[1], 100);
        const result = await dappToken.approve(accounts[1], 100, { from: accounts[0]});
        assert.equal(returnValue, true, "return value should be true");
        assert.equal(result.receipt.logs.length, 1 , "should trigger 1 event");
        assert.equal(result.receipt.logs[0].event, "Approval", "event should be Approval");
        assert.equal(result.receipt.logs[0].args._owner, accounts[0], "logs the _owner account");
        assert.equal(result.receipt.logs[0].args._spender, accounts[1], "logs the _spender account");
        assert.equal(result.receipt.logs[0].args._value, 100, "logs the _value - tokens to be transfered");
        const allowance = await dappToken.allowance(accounts[0], accounts[1]);
        assert.equal(allowance.toNumber(), 100, "stores the allowance for delegated transfer");
    });

    it("handles delegated transfers", async () => {
        fromAccount = accounts[2];
        toAccount = accounts[3];
        spendingAccount = accounts[4];
        //transfer some tokens to fromAccount from account[0]
        const transfer = await dappToken.transfer(fromAccount, 100, { from : accounts[0]});
        const approve = await dappToken.approve(spendingAccount, 10, { from: fromAccount});
        //try transfering more amount than the senders balance
        try {
            await dappToken.transferFrom(fromAccount, toAccount, 1000, { from : spendingAccount });
        } catch (error) {
            assert.equal(error.message.includes('revert'), true, "cannot transfer tokens more than fromAccount balance")
        }
        //try transfering more amount than the allowance amount
        try {
            await dappToken.transferFrom(fromAccount, toAccount, 20, { from : spendingAccount });
        } catch (error) {
            assert.equal(error.message.includes('revert'), true, "cannot transfer tokens more than allowance amount")
        }
        const returnValue = await dappToken.transferFrom.call(fromAccount, toAccount, 10, { from : spendingAccount });
        assert.equal(returnValue, true, "returnValue should be true");
        const transferFrom = await dappToken.transferFrom(fromAccount, toAccount, 10, { from : spendingAccount });
        assert.equal(transferFrom.receipt.logs.length, 1 , "should trigger 1 event");
        assert.equal(transferFrom.receipt.logs[0].event, "Transfer", "event should be Transfer");
        assert.equal(transferFrom.receipt.logs[0].args._from, fromAccount, "logs the _owner account");
        assert.equal(transferFrom.receipt.logs[0].args._to, toAccount, "logs the _spender account");
        assert.equal(transferFrom.receipt.logs[0].args._value, 10, "logs the _value - tokens to be transfered");
        const balanceOfFromAccount = (await dappToken.balanceOf(fromAccount)).toNumber();
        const balanceOfToAccount = (await dappToken.balanceOf(toAccount)).toNumber();
        assert.equal(balanceOfFromAccount, 90, "deducts the amount from the sending account");
        assert.equal(balanceOfToAccount, 10, "adds the amount from the receiving account");
        const remainingAllowance = (await dappToken.allowance(fromAccount, spendingAccount)).toNumber();
        assert.equal(remainingAllowance, 0, "deducts the amount from allowance and updates it")
    })

})