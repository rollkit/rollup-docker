package keeper_test

import (
	"context"
	"testing"

	keepertest "coolchain/testutil/keeper"
	"coolchain/x/coolchain/keeper"
	"coolchain/x/coolchain/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
)

func setupMsgServer(t testing.TB) (types.MsgServer, context.Context) {
	k, ctx := keepertest.CoolchainKeeper(t)
	return keeper.NewMsgServerImpl(*k), sdk.WrapSDKContext(ctx)
}
