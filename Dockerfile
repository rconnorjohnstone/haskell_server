FROM archlinux:latest

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm \
    ghc \
    nginx \
    stack \
    make

