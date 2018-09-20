FROM golang:1.10-alpine3.8
RUN apk add -U py-pip bash curl jq git
RUN go get -u github.com/koron/sqs-notify/cmd/sqs-notify2
ENV PATH $GOPATH/bin:$PATH
RUN pip install awscli
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.3/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl

WORKDIR /app

ENV AWS_DEFAULT_REGION ap-southeast-2
ENV DRAIN_TIMEOUT 300s

COPY ./entrypoint /app/
COPY ./drain /app/

ENTRYPOINT [ "/app/entrypoint" ]
