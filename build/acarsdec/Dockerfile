FROM libacars:latest as build

WORKDIR /app
RUN apk add --no-cache git make cmake gcc libc-dev pkgconf librtlsdr-dev
RUN git clone https://github.com/wiedehopf/acarsdec .
WORKDIR /app/build
RUN cmake .. -Drtl=ON && make

FROM libacars:latest as main

ENV ID=""
ENV DEVICE="0"
ENV FEEDS="-j feed.acars.io:5550"
ENV FREQS="131.525 131.550 131.725 131.850"

WORKDIR /acarsdec
RUN apk add --no-cache librtlsdr
COPY --from=build /app/build/acarsdec /usr/local/bin
COPY /start.sh /start.sh

CMD ["/bin/sh", "/start.sh"]