FROM debian:bookworm-20240408-slim AS base
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
  && mkdir /opt/ziglang/ \
  && tar -xf zig-linux-x86_64-${VERSION}.tar.xz \
  && mv zig-linux-x86_64-${VERSION}/zig /opt/ziglang/zig

FROM base AS latest
RUN useradd -m -s /bin/bash -u 1000 zig
COPY --chown=zig:zig --chmod=555 --from=exilesprx/exercism-zig:source /opt/ziglang/zig /usr/local/bin/zig
USER zig
