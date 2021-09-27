const path = require('path');
const fs = require('fs');
const solc = require('solc');

const inboxPath = path.join(__dirname, 'contracts', 'Dragon.sol');
const source = fs.readFileSync(inboxPath, 'utf8');

var input = {
  language: 'Solidity',
  sources: {
    'Dragon.sol': {
      content: source
    }
  },
  settings: {
    outputSelection: {
      '*': {
        '*': ['*']
      }
    }
  }
};


const tempFile = JSON.parse(solc.compile(JSON.stringify(input)));
const contractFile = tempFile.contracts['Dragon.sol']['Dragon'];
module.exports = contractFile;