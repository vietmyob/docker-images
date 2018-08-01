FROM alpine:3.8 as builder

RUN apk update && apk add curl

ENV BK_METRICS_VERSION="v3.0.1"
RUN curl -L -o /buildkite-metrics https://github.com/buildkite/buildkite-metrics/releases/download/${BK_METRICS_VERSION}/buildkite-metrics-${BK_METRICS_VERSION}-linux-amd64 \
    && chmod +x /buildkite-metrics 

FROM scratch

COPY --from=builder /buildkite-metrics /buildkite-metrics
EXPOSE 8080
ENTRYPOINT /buildkite-metrics
