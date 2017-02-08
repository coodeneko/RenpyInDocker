# Renpy in Docker

[![Build Status](https://travis-ci.org/kreutzwj/RenpyInDocker.svg?branch=master)](https://travis-ci.org/kreutzwj/RenpyInDocker)


## About this Repo

This is a git repo of the Docker image for [Ren'py](https://www.renpy.org). It can be used for quick automated testing. SDL has been disabled so asking for anything besides linting and compiling will likely cause errors.

## Installation

```bash
docker pull codeneko/renpy
```

A specific version can be requested by adding the Ren'py version number as a tag.
```bash
docker pull codeneko/renpy:6.99.11
```

To see available tags vists the [Docker Repository's Tag Page](https://hub.docker.com/r/codeneko/renpy/tags/)

## Usage

`RENPY_VERSION` will let you know what version of renpy is installed.
`RENPY_DIR` is the absolute path to where Ren'py is installed.

The image comes complete with curl and wget for network file transfers and tar and unzip for dealing with compressed files.

To make a build is simple. While in the docker container
```bash
cd $RENPY_DIR
./renpy.sh launcher distribute $YOUR_PROJECT_DIRECTORY
```

Linting is also available. The build will most likely exist in a folder one step up from the project directory unless the build variable in Ren'py has been changed.