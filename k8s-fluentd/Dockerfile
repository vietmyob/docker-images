FROM fluent/fluentd:v1.2.5
USER root
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
        libffi-dev \
    && gem install -N \
        fluent-plugin-cloudwatch-logs:0.5.0 \
        fluent-plugin-kubernetes_metadata_filter:2.1.2 \
        fluent-plugin-prometheus:1.0.1 \
        fluent-plugin-rewrite-tag-filter:2.0.2 \
        ffi \
        fluent-plugin-systemd:1.0.1 \
        fluent-plugin-datacounter:1.0.0 \
    && apk del .build-deps \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Run Fluentd
ENTRYPOINT [ "fluentd", "-p", "/fluentd/plugins", "-c", "/etc/fluentd/fluent.conf" ]
