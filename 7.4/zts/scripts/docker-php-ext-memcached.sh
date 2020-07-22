#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  cyrus-sasl-dev \
  g++ \
  gcc \
  libmemcached-dev \
  make \
  re2c \
  zlib-dev

apk add -u --no-cache libmemcached

pecl install memcached
docker-php-ext-enable memcached
