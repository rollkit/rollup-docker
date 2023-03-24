package coolchain_test

import (
	"testing"

	keepertest "coolchain/testutil/keeper"
	"coolchain/testutil/nullify"
	"coolchain/x/coolchain"
	"coolchain/x/coolchain/types"
	"github.com/stretchr/testify/require"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		Params: types.DefaultParams(),

		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.CoolchainKeeper(t)
	coolchain.InitGenesis(ctx, *k, genesisState)
	got := coolchain.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	nullify.Fill(&genesisState)
	nullify.Fill(got)

	// this line is used by starport scaffolding # genesis/test/assert
}
