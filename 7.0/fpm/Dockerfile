FROM php:7.0-fpm-alpine

LABEL maintainer="Ammar K."

ARG DOCKER_PHP_AMQP=0
ARG DOCKER_PHP_APCU=0
ARG DOCKER_PHP_COMPOSER=0
ARG DOCKER_PHP_GMP=0
ARG DOCKER_PHP_IMAGICK=0
ARG DOCKER_PHP_MAILPARSE=0
ARG DOCKER_PHP_MEMCACHED=0
ARG DOCKER_PHP_MONGODB=0
ARG DOCKER_PHP_OPCACHE=0
ARG DOCKER_PHP_PCNTL=0
ARG DOCKER_PHP_PHALCON=0
ARG DOCKER_PHP_RAPHF=0
ARG DOCKER_PHP_REDIS=0
ARG DOCKER_PHP_SSH2=0
ARG DOCKER_PHP_SWOOLE=0
ARG DOCKER_PHP_XDEBUG=0
ARG PHP_FULL_INSTALL=0

RUN set -x \
    && apk update \
    && apk add -u --no-cache --virtual .build-deps \
        freetype-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libxslt-dev \
        zlib-dev \
    && apk add -u --no-cache \
        freetype \
        icu \
        libjpeg-turbo \
        libmcrypt \
        libpng \
        libxslt \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && NPROC=$(getconf _NPROCESSORS_ONLN) \
    && docker-php-ext-install -j${NPROC} \
        bcmath \
        gd \
        intl \
        mcrypt \
        mysqli \
        pdo_mysql \
        soap \
        xsl \
        zip \
    && apk del .build-deps
