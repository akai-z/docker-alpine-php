#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps gmp-dev
apk add -u --no-cache gmp

NPROC=$(getconf _NPROCESSORS_ONLN)
docker-php-ext-install -j${NPROC} gmp
