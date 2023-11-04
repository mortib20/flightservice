FROM alpine:latest as build

WORKDIR /app
RUN apk add --no-cache git make cmake gcc libc-dev zlib-dev zstd-dev libxml2-dev
RUN git clone https://github.com/szpajder/libacars .
WORKDIR /app/build
RUN cmake ..
RUN make
RUN make install

FROM alpine:latest as main

WORKDIR /libacars
RUN apk add --no-cache libxml2 zlib
COPY --from=build /usr/local/lib/ /usr/local/lib/
COPY --from=build /usr/local/include/libacars-2/ /usr/local/include/libacars-2/
COPY --from=build /usr/local/share/doc/libacars-2/ /usr/local/share/doc/libacars-2/
COPY --from=build /usr/local/bin/ /usr/local/bin/