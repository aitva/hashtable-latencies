#!/bin/sh
set -e
docker run -tid -p 8080:8080 \
    -v "$PWD":/hashtable-latencies \
    -w /hashtable-latencies \
    hashtable-haskell \
    .stack-work/install/*/lts-6.0/7.10.3/bin/htlatencies-exe +RTS -N4
