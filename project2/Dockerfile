FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

RUN npm install dotenv

RUN npm install aws-sdk aws-parameter-store-env

COPY . .

EXPOSE 80

CMD [ "node", "index.js" ]
