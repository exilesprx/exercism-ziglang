FROM debian:stable-20250908-slim AS base
RUN apt-get -y update \
  && apt-get -y install --no-install-recommends \
  ca-certificates \
  wget \
  xz-utils \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*


FROM base AS install
ARG VERSION=
WORKDIR /opt
RUN  wget -q https://ziglang.org/builds/zig-x86_64-linux-${VERSION}.tar.xz \
  && tar -xf zig-x86_64-linux-${VERSION}.tar.xz \
  && mv zig-x86_64-linux-${VERSION}/* /usr/local/bin \
  && rm -rf /opt/zig-x86_64-linux-${VERSION}.tar.xz


FROM install  AS build
COPY --from=install /usr/local/bin /usr/local/bin
RUN useradd -m -s /bin/bash -u 1000 zig \
  && chown -R zig:zig /usr/local/bin
WORKDIR /home/zig
USER zig
