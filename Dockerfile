FROM alpine
MAINTAINER Dzmitry Akunevich, dzmitry@akunevich.com

ENV GOR_VERSION 0.16.1

RUN apk add --update -t deps wget ca-certificates 
    
RUN wget https://github.com/buger/goreplay/releases/download/v${GOR_VERSION}/gor_${GOR_VERSION}_x64.tar.gz \
    && tar zxvf gor_${GOR_VERSION}_x64.tar.gz  \
    && rm -rf gor_${GOR_VERSION}_x64.tar.gz \
    && chmod +x goreplay \
    && mv ./goreplay /usr/local/bin/goreplay \
    && apk del --purge deps \
    && rm /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/goreplay"]

