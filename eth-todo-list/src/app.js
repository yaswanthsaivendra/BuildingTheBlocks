App = {
    load : async () => {
        await App.loadWeb3()
        // await App.loadAccount()
    },

    loadWeb3: async () => {
        // Modern dapp browsers...
        if (window.ethereum) {
          window.web3 = new Web3(ethereum)
          await ethereum.enable()
        }
        else if (window.web3) {
          window.web3 = new Web3(window.web3.currentProvider)
        }
        else {
          console.log('Non-Ethereum browser detected. You should consider trying MetaMask!')
        }
    },

    // loadAccount: async () => {
    //     App.account = web3.eth.accounts[0]
    //     console.log(App.account);
    // }

}

$(() =>{
    $(window).load(() => {
        App.load()
    })
})