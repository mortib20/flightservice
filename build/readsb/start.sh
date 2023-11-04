#!/bin/sh
echo $UUID > /uuid

readsb \
--quiet \
--write-json ./ --write-json-every 1 \
--device-type rtlsdr --device $DEVICE \
--lat $LAT --lon $LON \
--uuid-file /uuid \
$EXTRA \
--net \
--net-ri-port 30001 \
--net-ro-port 30002 \
--net-sbs-port 30003 \
--net-sbs-jaero-in-port 30031 \
--net-sbs-in-port 30030 \
--net-bi-port 30004,30104 \
--net-bo-port 30005 \
$FEEDS
