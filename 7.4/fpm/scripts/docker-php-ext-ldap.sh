#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps \
  openldap-dev

docker-php-ext-install -j${NPROC} ldap
