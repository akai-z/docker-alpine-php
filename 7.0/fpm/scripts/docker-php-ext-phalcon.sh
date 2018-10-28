#!/bin/sh

set -eo pipefail

readonly VERSION="latest"
readonly REPOSITORY="phalcon/cphalcon"
readonly SOURCE="https://api.github.com/repos/${REPOSITORY}/releases/${VERSION}"
readonly SOURCE_DIR="docker-php-ext-cphalcon"

apk add -u --no-cache --virtual .build-deps \
  autoconf \
  file \
  g++ \
  gcc \
  make \
  pcre-dev \
  re2c

mkdir $SOURCE_DIR
cd $SOURCE_DIR

curl $SOURCE \
  | grep "tarball_url" \
  | cut -d '"' -f 4 \
  | xargs curl -L \
  | tar -zx --strip 1

cd build
./install

cd ../..
rm -rf $SOURCE_DIR

docker-php-ext-enable phalcon
