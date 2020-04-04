#!/bin/sh

set -eo pipefail

readonly VERSION="4.2.9"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make \
  pcre-dev

pecl install swoole-${VERSION}
docker-php-ext-enable swoole
