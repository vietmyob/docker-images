FROM alpine:3.6

ENV KUBE_LATEST_VERSION="v1.6.3"

RUN apk -v --update add python py-pip ca-certificates jq \
	&& apk add --update -t deps curl \
    && pip install --upgrade awscli \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 	&& chmod +x /usr/local/bin/kubectl \
    && apk -v --purge del py-pip deps \
    && rm /var/cache/apk/*
