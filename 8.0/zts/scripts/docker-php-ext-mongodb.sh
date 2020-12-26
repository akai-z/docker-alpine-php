#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make \
  openssl-dev \
  pcre-dev

apk add -u --no-cache openssl

pecl install mongodb
docker-php-ext-enable mongodb
