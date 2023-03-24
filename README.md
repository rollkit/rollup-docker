# Rollkit + Cosmos Rollup Container
This container builds a minimal rollup chain using ignite with [Rollkit](https://github.com/rollkit/rollkit) and the [modified Cosmos-SDK](https://github.com/rollkit/cosmos-sdk).

## How to use:
build:
`docker build . -t rolltest`
run with docker1.key
`docker run -it -e KEYNAME=docker1 rolltest`
run with docker2.key
`docker run -it -e KEYNAME=docker2 rolltest`

Once in the container, use the chain with
`go/bin/coolchaind [your command]`
