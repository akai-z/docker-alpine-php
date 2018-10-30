#!/bin/sh

set -eo pipefail

readonly VERSION="4.0.11"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make \
  pcre-dev

pecl install apcu-${VERSION}
docker-php-ext-enable apcu
