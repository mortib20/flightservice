FROM debian:bullseye AS piaware

WORKDIR /app

RUN apt update && \
apt install debhelper git wget tcl-dev python3-dev \
python3-venv libssl-dev chrpath python3-setuptools \
libboost-system-dev libboost-program-options-dev \
libboost-regex-dev libboost-filesystem-dev patchelf -y
RUN git clone https://github.com/flightaware/piaware_builder .
RUN ./sensible-build.sh bullseye
WORKDIR /app/package-bullseye
RUN dpkg-buildpackage -b

FROM debian:bullseye AS tcl

WORKDIR /app

RUN apt update && apt install git wget debhelper tcl-dev python3-dev python3-venv libssl-dev chrpath python3-setuptools libboost-system-dev libboost-program-options-dev libboost-regex-dev libboost-filesystem-dev patchelf -y
RUN git clone https://github.com/flightaware/tcltls-rebuild.git .
RUN ./prepare-build.sh bullseye
WORKDIR /app/package-bullseye
RUN dpkg-buildpackage -b

FROM debian:bullseye-slim AS main

ENV FEEDER_ID=""
ENV RECEIVER_HOST=localhost
ENV RECEIVER_PORT=30005
ENV MLAT_RESULTS="beast,connect,localhost:30004"

WORKDIR /piaware
RUN apt update && apt install libtcl -y
COPY --from=piaware /app/piaware_8.2_amd64.deb /piaware
COPY --from=tcl /app/tcl-tls_1.7.22-2+fa1_amd64.deb /piaware
COPY ./start.sh /start.sh
RUN apt install ./tcl-tls_1.7.22-2+fa1_amd64.deb -y
RUN apt install ./piaware_8.2_amd64.deb -y

CMD ["/bin/bash", "/start.sh"]