#
# RSK Node Dockerfile
#

# Pull base image.
FROM ubuntu:latest

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
  apt-get install -y curl git npm && \
  rm -rf /var/lib/apt/lists/* && \
  rm -f /etc/rsk/node.conf  && \
  apt-get clean

RUN \
  npm install -g n && \
  n stable && \
  npm install -g npm && \
  npm install -g pm2


# Supervisod CONF
COPY node.conf  /etc/rsk/node.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN \
  git clone https://github.com/cubedro/eth-net-intelligence-api.git && \
  cd eth-net-intelligence-api && npm install && \
  sed -i s/"WS_SECRET".*/"WS_SECRET\":"\"oracle\",/g app.json && \
  sed -i s/"WS_SERVER".*/"WS_SERVER\":"\"rskstats_rsk_stats_1:3000\",/g app.json && \
  sed -i s/"INSTANCE_NAME".*/"INSTANCE_NAME\":"\"$(hostname)\",/g app.json
# Define default command.

CMD ["sh", "-c", "pm2 start app.json && /usr/bin/supervisord"]
WORKDIR /eth-net-intelligence-api/

## RPC, P2P
EXPOSE 8545
EXPOSE 30303

