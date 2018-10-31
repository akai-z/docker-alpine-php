#!/bin/sh

set -eo pipefail

readonly VERSION="2.2.0"

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

pecl install memcached-${VERSION}
docker-php-ext-enable memcached
