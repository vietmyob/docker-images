FROM openresty/openresty:alpine-fat
RUN apk add -U openssl-dev git ca-certificates
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc
COPY openidc.lua /usr/local/openresty/luajit/share/lua/5.1/resty/openidc.lua
