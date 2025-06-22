# build
FROM alpine:latest AS build

RUN apk add --update hugo

WORKDIR /portfolio

COPY . .

RUN hugo 

# runner
FROM nginx:1.25-alpine

WORKDIR /usr/share/nginx/html

COPY --from=build /portfolio/public/* .

EXPOSE 80/tcp