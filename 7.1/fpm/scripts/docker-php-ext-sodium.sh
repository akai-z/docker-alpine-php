#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  libsodium-dev \
  make

apk add -u --no-cache libsodium

pecl install libsodium
docker-php-ext-enable sodium
