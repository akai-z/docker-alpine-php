#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make \
  pcre-dev

pecl install apcu
docker-php-ext-enable apcu
