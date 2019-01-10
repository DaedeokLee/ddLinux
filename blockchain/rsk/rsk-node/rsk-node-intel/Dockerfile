#
# RSK Node Dockerfile
#

# Pull base image.
FROM ubuntu:latest

RUN apt-get update 
RUN apt-get install -y curl git npm && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common

RUN \
    npm install -g n && \
    n stable && \
    npm install -g npm && \
    npm install -g pm2

RUN \
    cd /root && \
    git clone https://github.com/cubedro/eth-net-intelligence-api.git && \
    cd /root/eth-net-intelligence-api && npm install

COPY app.json /root/eth-net-intelligence-api/app.json

WORKDIR /root/eth-net-intelligence-api
CMD ["sh", "-c","pm2 start app.json && pm2 log 0"]


