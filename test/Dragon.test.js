const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const compileFile = require('../compile');

const bytecode = compileFile.evm.bytecode.object;
const abi = compileFile.abi;

const web3 = new Web3(ganache.provider());

let accounts;
let dragon;

beforeEach(async () => {
    accounts = await web3.eth.getAccounts();
    dragon = await new web3.eth.Contract(abi)
        .deploy({data: '0x' + bytecode})
        .send({from: accounts[0], gas: '6000000'});
})

describe('Dragon', () => {
    it('deploys a contract', () => {
        assert.ok(dragon.options.address);
    })
})