#!/bin/bash
echo 00000000 | go/bin/coolchaind keys import $KEYNAME $KEYNAME.key --keyring-backend test

CHAIN_ID=coolchain
CHAINFLAG="--chain-id ${CHAIN_ID}"
NAMESPACE_ID=a8dd6e02a05a4f01
DA_BLOCK_HEIGHT=$(curl http://celestia-local:26657/block | jq -r '.result.block.header.height')
echo height is $DA_BLOCK_HEIGHT
echo aggregator is $AGGREGATOR

/go/bin/coolchaind start $AGGREGATOR --rollkit.da_layer celestia --rollkit.da_config='{"base_url":"http://celestia-local:26659","timeout":60000000000,"fee":6000,"gas_limit":6000000}' --rollkit.namespace_id $NAMESPACE_ID --rollkit.da_start_height $DA_BLOCK_HEIGHT --rpc.laddr tcp://0.0.0.0:26657
