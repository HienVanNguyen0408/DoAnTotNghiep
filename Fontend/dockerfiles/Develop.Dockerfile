# build stage
FROM node:16-alpine  as build-stage
WORKDIR /app
COPY . .
RUN npm install 
COPY . .
RUN npm run serve
