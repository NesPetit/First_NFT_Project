FROM node:12.13.0-slim

MAINTAINER alec/alex 
WORKDIR /app

COPY web_blockchain/package.json ./web_blockchain
COPY web_blockchain/package-lock.json ./web_blockchain
COPY web_blockchain/src ./src/web_blockchain
COPY web_blockchain/public ./public/web_blockchain
COPY contracts . 
COPY migrations . 
COPY package-lock.json . 
COPY README.md . 
COPY truffle-config.js . 

RUN npm install
RUN npm install -g truffle
RUN truffle compile

EXPOSE 8080
VOLUME /app/logs

CMD npm start
