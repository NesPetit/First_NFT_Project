import React, { Component } from 'react'
import Web3 from 'web3'
import erc721_abi from './ERC721.json'
import addresse from './adresse_ERC721.json'


class App extends Component {
  componentWillMount() {
    this.loadBlockchainData()
  }

  async loadBlockchainData() {
    const web3 = new Web3(Web3.givenProvider || "http://localhost:7545")
    Web3.givenProvider.enable()
    const accounts = await web3.eth.getAccounts()
    this.setState({ account: accounts[0] })
    const chainId = await web3.eth.getChainId()
    this.setState({ chain_id: chainId })
    const blockNum = await web3.eth.getBlockNumber()
    this.setState({ last_block: blockNum })   
  
    var myContract = new web3.eth.Contract(erc721_abi.abi, addresse.ERC721);
    const name_t = await myContract.methods.name().call()
    this.setState({ name_t: name_t })   
    const counter_t = await myContract.methods.counter().call()
    this.setState({ counter_t: counter_t })   
  }

  constructor(props) {
    super(props)
    this.state = { account: '', chainId:'', blockNum:'', name_t:'', counter_t:'' }
  }

  render() {
    return (
      <div className="container">
        <h1>Hello, World!</h1>
        <p>Your account: {this.state.account}</p>
        <p>ChainID : {this.state.chain_id}</p>
        <p>Last block : {this.state.last_block}</p>

        <p>Name : {this.state.name_t}</p>
        <p>Total token number : {this.state.counter_t}</p>

      </div>
    );
  }
}

export default App;