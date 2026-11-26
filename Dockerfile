FROM node:26.13.1-alpine AS build

WORKDIR /home/node/app

COPY . .

RUN npm install

RUN npm install -g @angular/cli

RUN npm run build --prod


FROM nginx:1.31.10

WORKDIR /usr/share/nginx/html

COPY --from=build /home/node/app/dist/octil-spa/browser .
