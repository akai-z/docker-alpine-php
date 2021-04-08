FROM php:8.0-fpm-alpine

LABEL maintainer="Ammar K."

ARG DOCKER_PHP_APCU=0
ARG DOCKER_PHP_COMPOSER=0
ARG DOCKER_PHP_GMP=0
ARG DOCKER_PHP_LDAP=0
ARG DOCKER_PHP_MAILPARSE=0
ARG DOCKER_PHP_MEMCACHED=0
ARG DOCKER_PHP_MONGODB=0
ARG DOCKER_PHP_OPCACHE=0
ARG DOCKER_PHP_PCNTL=0
ARG DOCKER_PHP_PSR=0
ARG DOCKER_PHP_RAPHF=0
ARG DOCKER_PHP_REDIS=0
ARG DOCKER_PHP_SWOOLE=0
ARG DOCKER_PHP_XDEBUG=0
ARG PHP_FULL_INSTALL=0

COPY scripts/*.sh /usr/local/bin/

RUN set -x \
    && apk update \
    && apk add -u --no-cache --virtual .build-deps \
        freetype-dev \
        gettext-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libxslt-dev \
        libzip-dev \
    && apk add -u --no-cache \
        freetype \
        gettext \
        icu \
        libjpeg-turbo \
        libpng \
        libxslt \
        libzip \
    && docker-php-ext-configure gd \
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/ \
    && NPROC=$(getconf _NPROCESSORS_ONLN) \
    && docker-php-ext-install -j${NPROC} \
        bcmath \
        gd \
        gettext \
        intl \
        mysqli \
        pdo_mysql \
        soap \
        xsl \
        zip \
    && docker-php-extensions-installer.sh \
    && apk del .build-deps
