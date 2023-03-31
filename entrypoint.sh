VALIDATOR_NAME=validator1
# VALIDATOR_NAME2=validator2
CHAIN_ID=gm
KEY_NAME=key1
KEY_NAME2=key2
CHAINFLAG="--chain-id ${CHAIN_ID}"
TOKEN_AMOUNT="10000000000000000000000000stake"
STAKING_AMOUNT="1000000000stake"
DA_BLOCK_HEIGHT=$(curl http://celestia-local:26657/block | jq -r '.result.block.header.height')
echo DA HEIGHT: $DA_BLOCK_HEIGHT
NAMESPACE_ID="27e3b546191d5fbb"

/gmd start $HOMEFLAG --log_level debug --rollkit.da_layer celestia --rollkit.da_config='{"base_url":"http://celestia-local:26659","timeout":60000000000,"fee":6000,"gas_limit":6000000}' --rollkit.namespace_id $NAMESPACE_ID --rollkit.da_start_height $DA_BLOCK_HEIGHT --rpc.laddr tcp://0.0.0.0:26657 $P2PFLAG
