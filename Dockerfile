FROM alpine:latest

RUN  apk update \
  && apk upgrade \
  && apk add --update openjdk11 tzdata curl unzip bash \
  && rm -rf /var/cache/apk/* \
  && mkdir /app

ADD ./cli /app

WORKDIR /app

VOLUME /files
