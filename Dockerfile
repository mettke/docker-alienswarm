FROM alpine:latest

RUN : && \
    echo "x86" > /etc/apk/arch && \
    apk add \
        freetype \
        wine

RUN : && \
    addgroup -g 1000 steam && \
    adduser -u 1000 -G steam -H -D -S steam && \
    mkdir /steam && \
    chown steam:steam /steam

USER steam

ADD lib.sh /lib.sh 
ADD main /main 

VOLUME /steam

EXPOSE 27015/tcp
EXPOSE 27015/udp

CMD ["/bin/ash", "/main"]
