FROM fluent/fluentd:v0.12.40-debian

USER root
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

RUN buildDeps="sudo make gcc g++ libc-dev ruby-dev libffi-dev" \
  && apt-get update \
  && apt-get install \
  -y --no-install-recommends \
  $buildDeps \
  && echo 'gem: --no-document' >> /etc/gemrc \
  && gem install fluent-plugin-secure-forward \
  && gem install fluent-plugin-record-reformer \
  && gem install fluent-plugin-cloudwatch-logs -v 0.4.0 \
  && gem install fluent-plugin-kubernetes_metadata_filter \
  && gem install fluent-plugin-prometheus \
  && gem install ffi \
  && gem install fluent-plugin-systemd -v 0.0.8 \
  && SUDO_FORCE_REMOVE=yes \
  apt-get purge -y --auto-remove \
  -o APT::AutoRemove::RecommendsImportant=false \
  $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && gem sources --clear-all \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Environment variables
ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="/etc/fluentd/fluent.conf"

CMD exec fluentd -c $FLUENTD_CONF $FLUENTD_OPT