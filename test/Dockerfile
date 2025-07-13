FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV IN_CONTAINER=true

RUN apt update                                       \
    && apt upgrade --yes --no-install-recommends     \
    && apt install --yes --no-install-recommends     \
        ca-certificates curl openssl rsync sudo wget \
        ansible-core ansible-lint git stow           \
    && apt autoremove --yes                          \
    && apt autoclean                                 \
    && rm --recursive --force /var/lib/apt/lists/*
RUN /usr/sbin/usermod --login dotfile --move-home --home /home/dotfile ubuntu
RUN /usr/sbin/groupmod --new-name dotfile ubuntu
RUN echo 'dotfile ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/dotfile

COPY ansible/ /home/dotfile/.duplic8r/ansible/

USER root
RUN chown --recursive dotfile:dotfile /home/dotfile/.duplic8r/

USER dotfile

WORKDIR /home/dotfile/.duplic8r
