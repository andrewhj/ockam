FROM debian:buster-slim

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN set -xe;\
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends ca-certificates gnupg dirmngr curl gcc g++ make; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
# Install gosu
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    curl -o /usr/local/bin/gosu -sSL \
      "https://github.com/tianon/gosu/releases/download/1.12/gosu-$(dpkg --print-architecture)"; \
    curl -o /usr/local/bin/gosu.asc -sSL \
      "https://github.com/tianon/gosu/releases/download/1.12/gosu-$(dpkg --print-architecture).asc"; \
    gpg --verify /usr/local/bin/gosu.asc; \
    rm /usr/local/bin/gosu.asc; \
    chmod +x /usr/local/bin/gosu; \
# Install cmake
    curl -sSOL https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3-Linux-x86_64.tar.gz; \
    echo "da8093956f0b4ae30293c9db498da9bdeaeea4e7a2b1f2d1637ddda064d06dd0  cmake-3.17.3-Linux-x86_64.tar.gz" | \
      sha256sum -c -; \
    tar -xf cmake-3.17.3-Linux-x86_64.tar.gz -C /opt/; \
    rm -rf cmake-3.17.3-Linux-x86_64.tar.gz; \
    chmod +x /usr/local/bin/docker-entrypoint.sh

ENV PATH="/opt/cmake-3.17.3-Linux-x86_64/bin:${PATH}" \
    AR=/usr/bin/ar \
    AS=/usr/bin/as \
    CC=/usr/bin/gcc \
    CPP=/usr/bin/cpp \
    CXX=/usr/bin/g++

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
