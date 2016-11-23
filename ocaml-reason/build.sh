#!/bin/sh
set -e
docker build -t hashtable-ocaml .
docker run --rm -v "$PWD":/hashtable-latencies -w /hashtable-latencies hashtable-ocaml \
    ocamlbuild -pkgs cohttp,lwt,cohttp.lwt Main.native
