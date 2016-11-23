#!/bin/sh
set -e
docker run --rm -v "$PWD":/usr/src/hashtable-latencies -w /usr/src/hashtable-latencies golang:latest go build -v
