FROM debian:bookworm-20240513-slim AS base
FROM base AS source

ARG VERSION=

RUN apt-get -y update \
  && apt-get -y install --no-install-recommends \
  ca-certificates \
  git \
  wget \
  xz-utils \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN wget -q https://ziglang.org/builds/zig-linux-x86_64-${VERSION}.tar.xz \
  && tar -xf zig-linux-x86_64-${VERSION}.tar.xz \
  && mv /opt/zig-linux-x86_64-${VERSION} /opt/zig-linux-x86_64

FROM base AS latest
RUN useradd -m -s /bin/bash -u 1000 zig
COPY --chown=zig:zig --chmod=555 --from=source /opt/zig-linux-x86_64/ /opt/zig-linux-x86_64/
RUN ln -s /opt/zig-linux-x86_64/zig /usr/local/bin/zig
USER zig
WORKDIR /home/zig
