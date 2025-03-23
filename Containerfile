ARG BASE_IMAGE_NAME="kinoite"
ARG BASE_IMAGE_VARIANT="main"
ARG BASE_IMAGE_FEDORA_MAJOR_VERSION="41"
ARG BASE_IMAGE_RESOLVED="ghcr.io/ublue-os/${BASE_IMAGE_NAME}-${BASE_IMAGE_VARIANT}"

FROM ${BASE_IMAGE_RESOLVED}:${BASE_IMAGE_FEDORA_MAJOR_VERSION} AS base

## Other possible base images include:
# FROM ghcr.io/ublue-os/bazzite:latest
# FROM ghcr.io/ublue-os/bluefin-nvidia:stable
# 
# ... and so on, here are more base images
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
