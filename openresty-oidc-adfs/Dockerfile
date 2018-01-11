FROM openresty/openresty:1.11.2.5-alpine-fat
RUN apk add -U openssl-dev git ca-certificates
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc 1.4.1
