FROM python:2.7.12-alpine

RUN apk --update add libxml2-dev libxslt-dev gcc musl-dev && \
  rm -rf /tmp/* /var/cache/apk/*

RUN ["pip", "install", "aws-adfs==0.2.0"]

CMD ["aws-adfs"]
