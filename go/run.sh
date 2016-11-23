#!/bin/sh
set -e
docker run --rm -v "$PWD":/hashtable-latencies -w /hashtable-latencies golang:latest ./hashtable-latencies
