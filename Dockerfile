FROM alpine:3.18.3
RUN apk add --no-cache bash curl jq
COPY ./gmd_linux /gmd
COPY gm1 /root/.gm1
COPY gm2 /root/.gm2
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
#ENTRYPOINT ["/bin/bash"]
