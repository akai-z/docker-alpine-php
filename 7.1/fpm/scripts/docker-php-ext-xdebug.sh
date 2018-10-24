#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make

touch /var/log/xdebug.log

pecl install xdebug
docker-php-ext-enable xdebug
