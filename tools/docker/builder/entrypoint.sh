#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}

useradd --shell /bin/bash -u $USER_ID -o -c "" -m builder
export HOME=/home/builder

exec /usr/local/bin/gosu builder "$@"
