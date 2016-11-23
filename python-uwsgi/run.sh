#!/bin/sh
set -e
docker run -tid -p 8080:8080 \
    -v "$PWD":/hashtable-latencies \
    -w /hashtable-latencies \
    -e PYTHONUSERBASE=/usr/src/hashtable-latencies/pyenv \
    python:latest \
    pyenv/bin/uwsgi --master --die-on-term --disable-logging \
    --wsgi-file main.py \
    --http-socket :8080
    # --plugin gevent --gevent 1000
    # --workers 4
    # --plugin python
