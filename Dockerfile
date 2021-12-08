FROM adoptopenjdk/openjdk11

RUN mkdir /app

ADD ./cli /app

WORKDIR /app

VOLUME /files
