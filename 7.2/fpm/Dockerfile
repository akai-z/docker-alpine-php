FROM php:7.2-fpm-alpine

LABEL maintainer="Ammar K."

RUN set -x \
    && apk update \
    && apk add -u --no-cache --virtual .build-deps \
        freetype-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libxslt-dev \
        zlib-dev \
    && apk add -u --no-cache \
        freetype \
        icu \
        libjpeg-turbo \
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
        mysqli \
        pdo_mysql \
        soap \
        xsl \
        zip \
    && apk del .build-deps
