#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  g++ \
  gcc \
  imagemagick-dev \
  libtool \
  make \
  pcre-dev

apk add -u --no-cache imagemagick

pecl install imagick
docker-php-ext-enable imagick
