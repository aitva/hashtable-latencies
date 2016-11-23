#!/bin/sh
set -e
docker run --rm -tiv "$PWD":/hashtable-latencies -w /hashtable-latencies hashtable-ocaml ./Main.native
