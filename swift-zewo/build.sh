#!/bin/sh
set -e
docker build -t hashtable-swift .
docker run --rm \
    -v "$PWD":/hashtable-latencies \
    -w /hashtable-latencies \
    hashtable-swift \
    swift build --configuration release