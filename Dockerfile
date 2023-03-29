FROM golang:1.20.2

RUN apt-get update
RUN apt-get install jq -y

COPY docker1.key /
COPY docker2.key /

COPY coolchaind /go/bin/coolchaind

COPY genesis.json /root/.coolchain/config/genesis.json
EXPOSE 26657
COPY entrypoint.sh /
WORKDIR /
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
