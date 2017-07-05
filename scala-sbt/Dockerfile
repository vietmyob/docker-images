FROM openjdk:8-jdk-alpine

ENV SCALA_VERSION 2.12.2
ENV SCALA_HOME /usr/share/scala

ENV SBT_VERSION 0.13.15

# Install Bash
RUN apk add --no-cache bash

RUN \
  apk add --no-cache --virtual=build-dependencies wget ca-certificates && \
  cd "/tmp" && \

  # Install Scala
  wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
  tar xzf "scala-${SCALA_VERSION}.tgz" && \
  mkdir "${SCALA_HOME}" && \
  rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
  mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
  ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \

  # Install SBT
  wget "https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" && \
  tar -f "sbt-${SBT_VERSION}.tgz" -x -C /usr/local && \
  ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
  sbt sbtVersion && \

  # Clean up
  apk del build-dependencies && \
  rm -rf /tmp/*
