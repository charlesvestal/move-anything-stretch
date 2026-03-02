# Cross-compile stretch DSP plugin + Bungee for Ableton Move (aarch64)
# Bungee needs C++20 / CMake 3.30+, so we use Ubuntu 22.04 with GCC 12.
FROM ubuntu:22.04 AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        g++-12-aarch64-linux-gnu \
        gcc-12-aarch64-linux-gnu \
        git \
        ninja-build \
        python3-pip \
    && pip3 install cmake \
    && rm -rf /var/lib/apt/lists/*

# Set up cross-compiler symlinks
RUN update-alternatives --install /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-12 100 && \
    update-alternatives --install /usr/bin/aarch64-linux-gnu-g++ aarch64-linux-gnu-g++ /usr/bin/aarch64-linux-gnu-g++-12 100

ENV CC=aarch64-linux-gnu-gcc
ENV CXX=aarch64-linux-gnu-g++
ENV CROSS_PREFIX=aarch64-linux-gnu-

WORKDIR /build
