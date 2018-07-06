FROM debian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -qq -y curl unzip zip libyaml-dev libpython2.7-dev build-essential libssl-dev openssh-client
RUN apt-get -qq -y -t jessie-backports install jq


RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -q install -y nodejs python-pip python-yaml git-all && pip install awscli sed --quiet

RUN npm i -g npm
RUN npm install pm2@latest -g

