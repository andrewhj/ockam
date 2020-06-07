FROM docker.pkg.github.com/ockam-network/ockam/builder_base:0.1@sha256:f62cd8f924fbaeac42d280f7800686c3bc93514162451286d4a73bcbd21b1fbc
RUN set -xe; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --no-install-recommends gcc g++; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;
ENV AR=/usr/bin/ar \
    AS=/usr/bin/as \
    CC=/usr/bin/gcc \
    CPP=/usr/bin/cpp \
    CXX=/usr/bin/g++
