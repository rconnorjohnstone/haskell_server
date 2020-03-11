FROM base

RUN mkdir /site
WORKDIR /site

COPY stack.yaml .
COPY hackend.cabal .
COPY package.yaml .

RUN stack setup --system-ghc
RUN stack build --dependencies-only
RUN stack build yesod-bin

EXPOSE 3000 3443

COPY entrypoint.sh /usr/bin/entrypoint.sh

