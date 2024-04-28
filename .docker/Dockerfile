FROM debian:bookworm-20240408-slim

ARG VERSION=

RUN apt-get -y update \
  && apt-get -y install --no-install-recommends \
  ca-certificates \
  git \
  wget \
  xz-utils \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -m -s /bin/bash -u 1000 zig
WORKDIR /opt
RUN wget -q https://ziglang.org/builds/zig-linux-x86_64-${VERSION}.tar.xz \
  && tar -xf zig-linux-x86_64-${VERSION}.tar.xz \
  && mv zig-linux-x86_64-${VERSION}/* /usr/local/bin \
  && rm -rf /opt/zig-linux-x86_64-${VERSION}.tar.xz \
  && chown -R zig:zig /usr/local/bin
USER zig
