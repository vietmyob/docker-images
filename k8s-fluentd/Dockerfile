FROM fluent/fluentd:v0.12.33
USER root
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
        libffi-dev \
    && echo 'gem: --no-document' >> /etc/gemrc \
    && gem install fluent-plugin-secure-forward -v 0.4.5 \
    && gem install fluent-plugin-record-reformer -v 0.9.1 \
    && gem install aws-sdk-core -v 2.10.50 \
    && gem install fluent-plugin-cloudwatch-logs -v 0.4.0 \
    && gem install fluent-plugin-kubernetes_metadata_filter -v 0.29.0 \
    && gem install fluent-plugin-prometheus -v 0.3.0 \
    && gem install ffi -v 1.9.18 \
    && gem install fluent-plugin-systemd -v 0.0.8 \
    && apk del .build-deps \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Environment variables
ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="/etc/fluentd/fluent.conf"

# jemalloc is memory optimization only available for td-agent
# td-agent is provided and QA'ed by treasuredata as rpm/deb/.. package
# -> td-agent (stable) vs fluentd (edge)
#ENV LD_PRELOAD="/usr/lib/libjemalloc.so.2"

# Run Fluentd
CMD exec fluentd -c $FLUENTD_CONF $FLUENTD_OPT
