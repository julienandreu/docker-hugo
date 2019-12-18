FROM golang:1.13.5-alpine3.10

LABEL maintainer="Julien Andreu <julienandreu@me.com>"

ENV HUGO_HOMEDIR="/home/hugo"

RUN addgroup -g 1000 -S hugo \
    && adduser -S -D -H -u 1000 -h ${HUGO_HOMEDIR} -s /sbin/nologin -G hugo -g hugo hugo \
    && mkdir -p ${HUGO_HOMEDIR} \
    && chown hugo ${HUGO_HOMEDIR} \
    && apk add git gcc g++ musl-dev

USER hugo

RUN mkdir -p ${HUGO_HOMEDIR}/src \
    mkdir -p ${HUGO_HOMEDIR}/site \
    && git clone https://github.com/gohugoio/hugo.git ${HUGO_HOMEDIR}/src

RUN cd ${HUGO_HOMEDIR}/src \
    && go install --tags extended

WORKDIR ${HUGO_HOMEDIR}/site

STOPSIGNAL SIGTERM

CMD ["hugo"]
