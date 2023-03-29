FROM golang:1.20.2

RUN apt-get update
RUN apt-get install jq -y
ENV IGNITE_VERSION=0.26.1
# Install Ignite
RUN curl -L https://get.ignite.com/cli@v${IGNITE_VERSION}! | bash
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
COPY coolchain coolchain
COPY rollkit rollkit
COPY cosmos-sdk cosmos-sdk
COPY docker1.key /
COPY docker2.key /
WORKDIR cosmos-sdk
RUN go mod edit -replace github.com/rollkit/rollkit=../rollkit
RUN go mod tidy
RUN go mod download

WORKDIR ../coolchain
RUN go mod edit -replace github.com/cosmos/cosmos-sdk=../cosmos-sdk
RUN go mod edit -replace github.com/rollkit/rollkit=../rollkit
RUN go mod edit -replace github.com/tendermint/tendermint=github.com/celestiaorg/tendermint@v0.34.22-0.20221202214355-3605c597500d
RUN go mod tidy
RUN go mod download
RUN ignite chain build

COPY genesis.json /root/.coolchain/config/genesis.json
EXPOSE 26657

WORKDIR /
ENTRYPOINT ["/entrypoint.sh"]
