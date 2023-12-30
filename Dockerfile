FROM node:alpine AS build

WORKDIR ./dist/fit

COPY . .
RUN npm install && npm run build

## PREPARANDO SERVIDOR WEB COM NGINX
FROM nginx:latest
## COPIANDO O BUNDLE DA APLICACAO PARA A PASTA PADRAO DO INDEX DO NGINX
COPY --from=build ./dist/fit/dist/fit /usr/share/nginx/html

EXPOSE 80
