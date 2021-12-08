#FROM alpine:latest
FROM openjdk:11

#RUN  apk update \
#  && apk upgrade \
#  && apk add --update openjdk11 tzdata curl unzip bash \
#  && rm -rf /var/cache/apk/* \
#  && mkdir /app

RUN mkdir /app
ADD ./cli /app
COPY entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh
WORKDIR /app

VOLUME /files
ENTRYPOINT ["/app/entrypoint.sh"]
