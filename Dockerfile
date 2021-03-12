FROM openjdk:8-alpine

MAINTAINER Juergen Jakobitsch <jakobitschj@semantic-web.at>

RUN apk add --update bash python3 && rm -rf /var/cache/apk/*

ADD kafka_2.11-0.10.2.2.tgz /usr/local/apache-kafka/

RUN ln -s /usr/local/apache-kafka/kafka_2.11-0.10.2.2 /usr/local/apache-kafka/current

RUN rm -f /tmp/kafka_2.11-0.10.2.2.tgz

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

RUN ln -s /usr/local/apache-kafka/kafka_2.11-0.10.2.2 /app
RUN ln -s /usr/local/apache-kafka/kafka_2.11-0.10.2.2/config /config

ADD kafka-bin.py /app/bin/
ADD kafka-init /app/bin/
