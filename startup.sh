#!/bin/bash

docker volume create caddy_data
docker volume create caddy_config

docker build -t mlat-client:latest ./build/mlat-client
docker build -t libacars:latest ./build/libacars
docker build -t dumpvdl2:latest ./build/dumpvdl2

echo "docker compose up -d"
