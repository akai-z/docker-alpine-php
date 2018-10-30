#!/bin/sh

set -eo pipefail

readonly VERSION="0.13"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  libssh2-dev \
  make

pecl install ssh2-${VERSION}
docker-php-ext-enable ssh2
