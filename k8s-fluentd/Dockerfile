FROM fluent/fluentd:v1.2.5
USER root
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.4.4/bin:$PATH

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
        libffi-dev \
    && gem install -N \
        fluent-plugin-cloudwatch-logs:0.6.1 \
        fluent-plugin-kubernetes_metadata_filter:2.1.3 \
        fluent-plugin-prometheus:1.1.0 \
        fluent-plugin-rewrite-tag-filter:2.1.0 \
        ffi \
        fluent-plugin-systemd:1.0.1 \
        fluent-plugin-datacounter:1.0.0 \
    && apk del .build-deps \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Run Fluentd
ENTRYPOINT [ "fluentd", "-p", "/fluentd/plugins", "-c", "/etc/fluentd/fluent.conf" ]
