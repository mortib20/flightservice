FROM debian:latest as build

WORKDIR /srv
COPY ./download.sh ./
RUN apt-get update -y && apt-get install wget ca-certificates -y
RUN ./download.sh

FROM debian:latest as main

WORKDIR /srv
RUN apt-get update -y && apt-get install ca-certificates -y
COPY --from=build /srv/fr24feed/fr24feed /usr/local/bin
CMD [ "fr24feed" ]
