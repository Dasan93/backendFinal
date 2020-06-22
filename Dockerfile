#FROM node:latest

#WORKDIR /usr/src/app

#COPY package*.json ./

#RUN npm install

#COPY . .

#EXPOSE 3000

#CMD ["node", "dist/index.js"]

FROM node:latest as builder

WORKDIR /usr/src/app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

COPY package*.json ./

RUN npm install
FROM nginx

WORKDIR /usr/share/nginx/html/
COPY --from=builder /usr/src/app/dist/BackNodeFinal/ /usr/share/nginx/html
EXPOSE 3000

CMD ["node", "dist/index.js",nginx -g 'daemon off;']