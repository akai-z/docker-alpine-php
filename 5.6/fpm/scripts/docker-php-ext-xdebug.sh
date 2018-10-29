#!/bin/sh

set -eo pipefail

readonly VERSION="2.5.5"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make

touch /var/log/xdebug.log

pecl install xdebug-${VERSION}
docker-php-ext-enable xdebug
