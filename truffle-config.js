const HDWalletProvider = require('@truffle/hdwallet-provider');
require('babel-register');
require('babel-polyfill');

require('dotenv').config();


const PRIVATE_KEY = process.env.PRIVATE_KEY;
const INFURA_PROJECT_ID = process.env.INFURA_PROJECT_ID;


module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      // Match any network id.
      network_id: "*"
    },
    kovan: {
      provider: function () {
        return new HDWalletProvider(
          [PRIVATE_KEY],
          `https://kovan.infura.io/v3/${INFURA_PROJECT_ID}`
        )
      },
      network_id: 42
    }
  },
  contracts_directory: './client/src/contracts/',
  contracts_build_directory: './client/src/abis/',
  compilers: {
    solc: {
      version: "0.6.6",
      optimizer: {
        enabled: true,
        runs: 1
      }
    }
  }
}
