FROM cypress/browsers:chrome67

RUN apt-get update && apt-get -q install -y python-pip python-yaml && pip install awscli --quiet
RUN aws configure set s3.signature_version s3v4
