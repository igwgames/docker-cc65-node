# docker-cc65-node

Quick Dockerfile to create a container with dependencies used for quick NES game building.

cc65 is installed in `/tools/cc65`, complete with binaries.

nodejs, python and awscli are also installed, for use with various utility scripts.

Meant to be used with [nes-starter-kit](https://github.com/cppchriscpp/nes-starter-kit),
and any derivative projects. (It should also work for any other NES-based projects.)

It is also available on dockerhub: https://hub.docker.com/r/cppchriscpp/cc65-node/