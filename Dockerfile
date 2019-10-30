FROM python:2-slim

LABEL maintainer="Joel Kreutzwieser"

ARG RENPY_VERSION
ENV SDL_AUDIODRIVER="dummy" \
    SDL_VIDEODRIVER="dummy" \
    RENPY_DIR="/renpy" \
    RENPY_VERSION=${RENPY_VERSION:-"7.3.5"}

RUN apt-get -y update \
    && apt-get -y --no-install-recommends install \
        procps \
        bzip2 \
        ca-certificates \
        curl \
        tar \
        unzip \
        wget \
    && rm -Rf /var/lib/apt/lists/*

RUN wget -O renpy-$RENPY_VERSION-sdk.tar.bz2 https://www.renpy.org/dl/$RENPY_VERSION/renpy-$RENPY_VERSION-sdk.tar.bz2 \
    && tar -xf renpy-$RENPY_VERSION-sdk.tar.bz2 \
    && rm renpy-$RENPY_VERSION-sdk.tar.bz2 \
    && mv renpy-$RENPY_VERSION-sdk $RENPY_DIR