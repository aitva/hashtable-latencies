#!/bin/sh
set -e
docker run -tid -p 8080:8080 \
    -v "$PWD":/hashtable-latencies \
    -w /hashtable-latencies \
    node:latest \
    node main.js
