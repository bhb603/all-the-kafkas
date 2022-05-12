FROM amazonlinux:2

RUN yum install -y \
  java-1.8.0 \
  shadow-utils \
  tar \
  telnet \
  wget

WORKDIR /kafkas

RUN \
  wget -q https://archive.apache.org/dist/kafka/2.6.2/kafka_2.12-2.6.2.tgz && \
  tar -xzf kafka_2.12-2.6.2.tgz && \
  rm kafka_2.12-2.6.2.tgz

RUN wget -q https://archive.apache.org/dist/kafka/2.8.1/kafka_2.12-2.8.1.tgz && \
  tar -xzf kafka_2.12-2.8.1.tgz && \
  rm kafka_2.12-2.8.1.tgz

RUN wget -q https://dlcdn.apache.org/kafka/3.1.0/kafka_2.12-3.1.0.tgz && \
  tar -xzf kafka_2.12-3.1.0.tgz && \
  rm kafka_2.12-3.1.0.tgz

RUN useradd kafka --uid 10001
RUN chown -R kafka:kafka /kafkas

USER kafka
