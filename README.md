# Uniswap gasless transaction

This project demonstrates a Uniswap gasless transaction using Openzeppelin Defender. It comes with a main contract, a test for that contract, and a script that deploys that contract. And additional scripts to manage the relayer.

## Structure

- `app`: React code for the client dapp, bootstrapped with create-react-app.
- `autotasks/relay`: Javascript code for the meta-transaction relay, to be run as a Defender Autotask, compiled using rollup.
- `contracts`: Solidity code for the Registry contract, compiled with [hardhat](https://hardhat.org/).
- `scripts`: Custom scripts for common tasks, such as uploading Autotask code, signing sample meta-txs, etc.
- `src`: Shared code for signing meta-txs and interacting with the Forwarder contract.
- `test`: Tests for contracts and autotask.

## Scripts

- `yarn deploy`: Compiles and deploys the Registry and Forwarder contracts to xDAI, and writes their addresses in `deploy.json`.
- `yarn sign`: Signs a meta-tx requesting the registration of `NAME`, using the private key defined in `PRIVATE_KEY`, and writes it to `tmp/request.json`.
- `yarn events`: Lists all the `Registered` events from the deployed contract on xDAI.
- `yarn invoke`: Invokes the relay Autotask via `WEBHOOK_URL` with the contents of `tmp/request.json` generated by `yarn sign`.
- `yarn upload`: Compiles and uploads the Autotask code to `AUTOTASK_ID`.
- `yarn relay`: Runs the relay Autotask script locally, using the Defender Relayer for `RELAY_API_KEY`.
- `yarn test`: Runs tests for contracts and Autotask using hardhat.

## Environment

Expected `.env` file in the project root:

- `PRIVATE_KEY`: Private key used for deploying contracts and signing meta-txs locally.
- `RELAYER_API_KEY`: Defender Relayer API key, used for sending txs with `yarn relay`.
- `RELAYER_API_SECRET`: Defender Relayer API secret.
- `AUTOTASK_ID`: Defender Autotask ID to update when running `yarn upload`.
- `TEAM_API_KEY`: Defender Team API key, used for uploading autotask code.
- `TEAM_API_SECRET`: Defender Team API secret.

## .env setup

PRIVATE_KEY=<Place your PRIVATE_KEY>
TEAM_API_KEY=<Place your DEFENDER TEAM_API_KEY>
TEAM_API_SECRET=<Place your DEFENDER TEAM_API_SECRET>

## hardhat helper

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

## Run the code

To run the workshop code yourself on the xDai network you will need to [sign up to Defender](https://defender.openzeppelin.com/) and [apply for mainnet access](https://openzeppelin.com/apply/), or change the code to use a public testnet.

### Fork and clone the repo

First fork the repository and then Git Clone your fork to your computer and install dependencies

```js
$ git clone https://github.com/Abdulbaqui07/Gasless-Uniswap.git
$ cd Gasless-Uniswap
$ yarn
```
