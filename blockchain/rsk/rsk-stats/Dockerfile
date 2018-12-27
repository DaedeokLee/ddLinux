FROM node:10.15

RUN git clone https://github.com/rsksmart/stats.git
RUN cd stats
WORKDIR /stats

RUN npm install 
RUN npm install -g grunt-cli 
RUN grunt

ENV WS_SECRET oracle
EXPOSE 3000
CMD ["npm", "start"]
