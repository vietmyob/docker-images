FROM python:2.7.12-alpine

ENV TERRAFORM_VERSION=0.7.9
ENV TERRAFORM_CHECKSUM=ac1d0302818ae17f1042dc26407e7ff94cd1e34ed260dae9d72c75a4d0b59cfc

RUN apk --update add bash bash-doc bash-completion libxml2 libxml2-dev python-dev py-lxml ca-certificates libxslt-dev gcc musl-dev curl jq make openssl unzip zip && \
  mkdir -p /opt/terraform && \
  curl -L -o /opt/terraform/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  openssl dgst -sha256 /opt/terraform/terraform.zip \
    | grep $TERRAFORM_CHECKSUM \
    || (echo 'shasum mismatch' && false) && \
  unzip /opt/terraform/terraform.zip -d /opt/terraform/ && \
  ln -s /opt/terraform/terraform /usr/local/bin/terraform && \
  rm -rf /opt/terraform/terraform.zip /var/cache/apk/*

WORKDIR /root/app

CMD ["/bin/sh"]
