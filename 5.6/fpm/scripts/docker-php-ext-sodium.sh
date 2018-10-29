#!/bin/sh

set -eo pipefail

readonly VERSION="1.0.6"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  libsodium-dev \
  make

apk add -u --no-cache libsodium

pecl install libsodium-${VERSION}
docker-php-ext-enable libsodium
