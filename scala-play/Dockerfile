FROM openjdk:8-jdk-alpine

ENV SBT_VERSION 0.13.15

# Install Bash
RUN apk add --no-cache bash

# Install SBT
RUN apk add --no-cache --virtual=build-dependencies wget && \
    cd "/tmp" && \
    wget "https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" && \
    echo "b6e073d7c201741dcca92cfdd1dd3cd76c42a47dc9d8c8ead8df7117deed7aef  sbt-${SBT_VERSION}.tgz" | sha256sum -c - && \
    tar -f "sbt-${SBT_VERSION}.tgz" -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
    apk del build-dependencies

# Copy the locally configured 2.6.1 Play Scala project
COPY . /tmp/build/

# Compile source and test to load the dependencies for Play Scala
RUN cd "/tmp/build" && \
    sbt compile && \
    sbt test:compile && \
    rm -rf /tmp/*
