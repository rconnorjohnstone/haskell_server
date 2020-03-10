FROM base

RUN mkdir /site
WORKDIR /site

COPY stack.yaml .

RUN stack build --dependencies-only
