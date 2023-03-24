package keeper

import (
	"coolchain/x/coolchain/types"
)

var _ types.QueryServer = Keeper{}
