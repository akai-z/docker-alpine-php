#!/bin/sh

set -eo pipefail

readonly VERSION="2.1.6"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make \
  re2c

pecl install mailparse-${VERSION}
docker-php-ext-enable mailparse
