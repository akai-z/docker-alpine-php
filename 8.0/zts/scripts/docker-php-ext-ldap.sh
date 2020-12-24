#!/bin/sh

set -eo pipefail

apk add -u --no-cache --virtual .build-deps openldap-dev
apk add -u --no-cache libldap

NPROC=$(getconf _NPROCESSORS_ONLN)
docker-php-ext-install -j${NPROC} ldap
