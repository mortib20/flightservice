FROM debian:latest as build

RUN apt-get update && apt-get install -y build-essential cmake pkg-config libglib2.0-dev libconfig++-dev libliquid-dev libfftw3-dev zlib1g-dev git wget

WORKDIR /srv
RUN git clone https://github.com/szpajder/libacars
RUN git clone https://github.com/szpajder/dumphfdl
RUN git clone https://github.com/pothosware/SoapySDR.git
RUN git clone https://github.com/pothosware/SoapySDRPlay.git

# libacars
WORKDIR /srv/libacars/build
RUN cmake ..
RUN make
RUN make install
RUN ldconfig

# SDRPlay
WORKDIR /srv/SDRPlay
COPY ./InstallSDRPlay.sh ./InstallSDRPlay.sh
RUN ./InstallSDRPlay.sh

# SoapySDR
WORKDIR /srv/SoapySDR/build
RUN cmake ..
RUN make -j4
RUN make install
RUN ldconfig

# SoapySDRPlay
WORKDIR /srv/SoapySDRPlay/build
RUN cmake ..
RUN make -j4
RUN make install
RUN ldconfig

# dumphfdl
WORKDIR /srv/dumphfdl/build
RUN cmake ..
RUN make
RUN make install

WORKDIR /srv
COPY ./entrypoint.sh ./entrypoint.sh

ENV FEEDS=""
ENV FREQS="--sample-rate 250000 10081"

CMD [ "./entrypoint.sh" ]