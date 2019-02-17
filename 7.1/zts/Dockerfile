FROM php:7.1-zts-alpine

LABEL maintainer="Ammar K."

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
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
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
    && apk del .build-deps
