FROM libacars:latest as build

RUN apk add --no-cache git make cmake gcc g++ libstdc++-dev glib-dev libc-dev zlib-dev zstd-dev libxml2-dev sqlite-dev librtlsdr-dev protobuf-c-dev zeromq-dev

WORKDIR /statsd
RUN git clone https://github.com/romanbsd/statsd-c-client .
RUN make && make install

WORKDIR /app
RUN git clone https://github.com/szpajder/dumpvdl2 .
WORKDIR /app/build
RUN cmake ..
RUN make
RUN make install

FROM libacars:latest as main

ENV DEVICE="1"
ENV ID=""
ENV FILTERS="all,-avlc_s,-acars_nodata,-gsif,-x25_control,-idrp_keepalive,-esis"
ENV FEEDS="--output decoded:json:udp:address=feed.airframes.io,port=5552"
ENV FREQS="136725000 136775000 136825000 136875000 136975000"

RUN apk add --no-cache glib librtlsdr sqlite sqlite-libs protobuf-c zeromq
WORKDIR /dumpvdl2
COPY --from=build /usr/local/lib/libstatsdclient.so.2.0.1 /usr/local/lib/libstatsdclient.so.2.0.1
COPY --from=build /usr/local/lib/libstatsdclient.so.2.0.1 /usr/local/lib/libstatsdclient.so
COPY --from=build /usr/local/lib/libstatsdclient.so.2.0.1 /usr/local/lib/libstatsdclient.so.2
COPY --from=build /usr/local/include/statsd/ /usr/local/include/statsd/
COPY --from=build /usr/local/bin/dumpvdl2 /usr/local/bin/dumpvdl2
COPY /start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]