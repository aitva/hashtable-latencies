#!/bin/sh
set -e
#!/bin/sh
set -e
docker run --rm \
    -v "$PWD":/usr/src/hashtable-latencies \
    -w /usr/src/hashtable-latencies \
    -e PYTHONUSERBASE=/usr/src/hashtable-latencies/pyenv \
    python:latest \
    python -m pip install --quiet --user uwsgi
