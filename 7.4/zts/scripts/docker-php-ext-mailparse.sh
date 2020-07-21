#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make \
  re2c

pecl install mailparse
docker-php-ext-enable mailparse
