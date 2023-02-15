FROM node:14-alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm install
