FROM docker.pkg.github.com/ockam-network/ockam/gcc:8@sha256:5915c84af8c8f0a9fc6ab5b495560f1c566a3d5dcee3423f9ce338d5f63c8d0a
RUN set -xe; \
    export GNUPGHOME="$(mktemp -d)"; \
    curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --import - 2>&1; \
    gpg --export "0x6084F3CF814B57C1CF12EFD515CF4D18AF4F7421" | \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key --keyring /etc/apt/trusted.gpg.d/llvm.gpg add -; \
    echo "deb http://apt.llvm.org/buster/ llvm-toolchain-buster-10 main" | tee /etc/apt/sources.list.d/llvm.list; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y clang-10 lldb-10 lld-10 clangd-10; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf "$GNUPGHOME";
ENV LLVM_PREFIX=/usr/lib/llvm-10
