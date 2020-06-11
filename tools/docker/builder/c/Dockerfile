FROM debian:buster-slim@sha256:47bde1681ab5258dceb05ffcd7d8ef1d367ce5c6631075599fb74ab2101cd151

RUN set -xe;\
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends ca-certificates gnupg dirmngr curl make gcc g++; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    curl -sSOL https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3-Linux-x86_64.tar.gz; \
    echo "da8093956f0b4ae30293c9db498da9bdeaeea4e7a2b1f2d1637ddda064d06dd0  cmake-3.17.3-Linux-x86_64.tar.gz" | \
      sha256sum -c -; \
    tar -xf cmake-3.17.3-Linux-x86_64.tar.gz -C /opt/; \
    rm -rf cmake-3.17.3-Linux-x86_64.tar.gz;

ENV PATH="/opt/cmake-3.17.3-Linux-x86_64/bin:${PATH}" \
    AR=/usr/bin/ar \
    AS=/usr/bin/as \
    CC=/usr/bin/gcc \
    CPP=/usr/bin/cpp \
    CXX=/usr/bin/g++
