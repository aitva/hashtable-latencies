#!/bin/sh
set -e
opam install -y lwt cohttp
ocamlbuild -pkgs cohttp,lwt,cohttp.lwt Main.native
exec ./Main.native
