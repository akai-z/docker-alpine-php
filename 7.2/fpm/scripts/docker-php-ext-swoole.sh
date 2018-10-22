#!/bin/sh

set -eo pipefail

readonly VERSION="2.1.3"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make \
  pcre-dev

pecl install swoole-${VERSION}
docker-php-ext-enable swoole
