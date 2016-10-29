FROM haskell:latest

RUN cabal update
COPY . /app
WORKDIR /app
CMD ["./run.sh"]