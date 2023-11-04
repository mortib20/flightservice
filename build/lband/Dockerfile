FROM ubuntu:22.04 as build

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y sudo wget xfce4 tightvncserver expect xterm

# SDRReceiver
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git

WORKDIR /srv/SDRReceiver
RUN git clone https://github.com/mortib20/SDRReceiver .
RUN echo "y" | ./ci-linux-build.sh
WORKDIR /srv/SDRReceiver/bin/SDRReceiver
RUN echo "y" | ./install.sh

# JAERO
WORKDIR /srv/jaero
RUN wget https://github.com/jontio/JAERO/releases/download/latest/jaero_1.0.4.14-67-ga16a3ce-1_linux_x86_64.tar.gz -O - | tar -xz -C ../jaero
WORKDIR /srv/jaero/jaero
RUN echo "y" | ./install.sh

ENV USER=root
ENV PASSWORD=""
ENV GEO=1440x800
ENV SCREEN=:2

WORKDIR /srv
RUN mv /srv/SDRReceiver/sample_ini/ /srv/
COPY ./password.exp ./password.exp
COPY ./entrypoint.sh ./entrypoint.sh
COPY ./jaero.sh /srv/jaero.sh
CMD [ "./entrypoint.sh" ]