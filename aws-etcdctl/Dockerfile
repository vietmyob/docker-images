FROM ubuntu:16.04
MAINTAINER Platform Enablement

ENV VERSION 2.0.13
RUN apt-get update && \
    apt-get install -y curl python python-dev && \
    curl -LOks https://github.com/coreos/etcd/releases/download/v${VERSION}/etcd-v${VERSION}-linux-amd64.tar.gz && \
    tar zxvf etcd-v${VERSION}-linux-amd64.tar.gz && \
    cp etcd-v${VERSION}-linux-amd64/etcdctl /etcdctl && \
    chmod +x /etcdctl && \
    cp /etcdctl /usr/local/bin/etcdctl && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli && \
    rm -rf etcd-v*
