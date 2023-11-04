#!/bin/sh
source ./bin/activate && \
mlat-client \
--lat $LAT --lon $LON --alt $ALT --user $ID --input-connect $INPUT --server $SERVER --results $RESULTS