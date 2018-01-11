FROM python:2.7.14-alpine3.6

RUN apk update && apk add make curl jq bash openssl
RUN pip install awscli

ENV KUBECTLVERSION v1.8.0
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTLVERSION}/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/
