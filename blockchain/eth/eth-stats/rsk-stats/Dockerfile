FROM mhart/alpine-node:latest

ADD . /stats
WORKDIR /stats

RUN npm install && npm install -g grunt-cli && grunt

ENV WS_SECRET oracle
EXPOSE 3000
CMD ["npm", "start"]
