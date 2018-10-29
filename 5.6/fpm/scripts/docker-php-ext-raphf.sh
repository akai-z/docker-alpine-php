#!/bin/sh

set -eo pipefail

readonly VERSION="1.1.2"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  make

pecl install raphf-${VERSION}
docker-php-ext-enable raphf
