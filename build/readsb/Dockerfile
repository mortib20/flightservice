FROM alpine:latest as build

WORKDIR /build
RUN apk add --no-cache git make gcc libc-dev zlib-dev zstd-dev librtlsdr-dev
RUN git clone https://github.com/wiedehopf/readsb.git . && make -e RTLSDR=yes -e DISABLE_INTERACTIVE=yes

FROM alpine:latest as main

EXPOSE 30001 30002 30003 30004 30104 30005

ENV DEVICE=0
ENV LAT=0
ENV LON=0
ENV UUID=0
ENV FEEDS=""
ENV EXTRA=""

WORKDIR /readsb
RUN apk add --no-cache libusb librtlsdr zstd-libs
COPY --from=build /build/readsb /usr/local/bin/readsb
COPY /start.sh /start.sh

CMD [ "/bin/sh", "/start.sh" ]

# 30001:30001 RAW In
# 30002:30002 RAW Out
# 30003:30003 BaseStation Out
# 30004:30004 Beast In
# 30104:30104 Beast In
# 30005:30005 Beast Out
