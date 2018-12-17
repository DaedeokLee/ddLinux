#
# RSK Node Dockerfile
#

# Pull base image.
FROM ubuntu:latest

MAINTAINER RSK Release <support@rsk.co>

ARg DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends openjdk-8-jre supervisor systemd software-properties-common

# Install RSK.
RUN groupadd --gid 888 rsk && useradd rsk -d /var/lib/rsk -s /sbin/nologin --uid=888 --gid=888

RUN \
  add-apt-repository -y ppa:rsksmart/rskj && \
  apt-get update && \
  (echo rskj shared/accepted-rsk-license-v1-1 select true | /usr/bin/debconf-set-selections )&& \
  apt-get install -y --no-install-recommends rskj && \
  apt-get install git npm && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -f /etc/rsk/node.conf 

RUN \
  sudo npm install -g n && \
  sudo n stable && \
  sudo npm install -g npm
  npm install -g pm2

# Supervisod CONF
COPY node.conf  /etc/rsk/node.conf 
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN git clone https://github.com/cubedro/eth-net-intelligence-api.git
COPY app.json eth-net-intelligence-api/app.json
RUN cd eth-net-intelligence-api && npm install

COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT /root/start.sh

## RPC, P2P
EXPOSE 8545
EXPOSE 30303
