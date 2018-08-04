FROM alpine:3.8

RUN apk update && apk add curl ca-certificates

ENV BK_METRICS_VERSION="v3.0.1"
RUN curl -L -o /bin/buildkite-metrics https://github.com/buildkite/buildkite-metrics/releases/download/${BK_METRICS_VERSION}/buildkite-metrics-${BK_METRICS_VERSION}-linux-amd64 \
    && chmod +x /bin/buildkite-metrics 

EXPOSE 8080
ENTRYPOINT /bin/buildkite-metrics
