FROM golang:1.20.2

ENV IGNITE_VERSION=0.26.1
# Install Ignite
RUN curl -L https://get.ignite.com/cli@v${IGNITE_VERSION}! | bash
COPY coolchain coolchain
COPY rollkit rollkit
COPY cosmos-sdk cosmos-sdk
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

RUN /bin/bash
