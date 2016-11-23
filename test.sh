#!/bin/sh

if [ -z "$1" ]; then
    programs=`cat programs.txt`
else
    programs=$*
fi

for program in $programs
do
    cd $program

    echo "Building container $container..."
    ./build.sh

    echo "Running $container..."
    id=$(./run.sh)
    sleep 3s

    echo "Warming up $program..."
    wrk2 --latency -c 99 -t 3 -d 60 -R9000 'http://localhost:8080' | head -n17

    echo "Generating $program report..."
    wrk2 --latency -c 99 -t 3 -d 180 -R9000 'http://localhost:8080' > "../reports/$program"

    echo "Removing $container..."
    docker rm -f $id

    cd ..
done
