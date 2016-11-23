#!/bin/sh
set -e
docker build -t hashtable-haskell .
docker run --rm \
    -v "$PWD":/hashtable-latencies \
    -w /hashtable-latencies \
    hashtable-haskell \
    stack build --allow-different-user
