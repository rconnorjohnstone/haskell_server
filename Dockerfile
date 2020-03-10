FROM debian:latest

RUN apt-get update && apt-get upgrade

RUN apt-get install -y \
    haskell-platform \
    nginx \
    haskell-stack
