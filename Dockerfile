FROM nampdn/node-alpine-git:11 as base

RUN apk add --no-cache wget tar

RUN export PANDOC_VERSION=2.7.2 \
   && cd /tmp \
   && wget https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-${PANDOC_VERSION}-linux.tar.gz \
   && tar -xvzf pandoc-${PANDOC_VERSION}-linux.tar.gz \
   && mv ./pandoc-${PANDOC_VERSION}/bin/* /usr/bin \
   && rm -rf ./pandoc-${PANDOC_VERSION} pandoc-${PANDOC_VERSION}-linux.tar.gz

RUN apk del wget tar && rm -vrf /var/cache/apk/*
