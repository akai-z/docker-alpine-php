#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make

pecl install redis
docker-php-ext-enable redis
