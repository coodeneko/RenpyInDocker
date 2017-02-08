FROM ubuntu:latest

MAINTAINER Joel Kreutzwieser

ARG RENPY_VERSION
ENV SDL_AUDIODRIVER="dummy" \
    SDL_VIDEODRIVE="dummy" \
    RENPY_DIR="/renpy" \
    RENPY_VERSION=${RENPY_VERSION:-"6.99.12.2"}

RUN apt-get -y update \
    && apt-get -y --no-install-recommends install \
        bzip2 \
        ca-certificates \
        curl \
        tar \
        unzip \
        wget \
    && rm -Rf /var/lib/apt/lists/*

RUN wget -O renpy-$RENPY_VERSION-sdk.tar.bz2 http://www.renpy.org/dl/$RENPY_VERSION/renpy-$RENPY_VERSION-sdk.tar.bz2 \
    && tar -xf renpy-$RENPY_VERSION-sdk.tar.bz2 \
    && rm renpy-$RENPY_VERSION-sdk.tar.bz2 \
    && mv renpy-$RENPY_VERSION-sdk $RENPY_DIR