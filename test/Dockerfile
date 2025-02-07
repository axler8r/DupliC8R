FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV IN_CONTAINER=true

RUN apt update                                       \
    && apt upgrade --yes --no-install-recommends     \
    && apt install --yes --no-install-recommends     \
        ca-certificates curl openssl rsync sudo wget \
    && apt autoremove --yes                          \
    && apt autoclean                                 \
    && rm --recursive --force /var/lib/apt/lists/*
RUN echo 'duplic8r ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/duplic8r
RUN /usr/sbin/useradd --uid 1010 --create-home duplic8r

USER duplic8r
