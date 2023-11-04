#!/bin/bash
rm /etc/piaware.conf
touch /etc/piaware.conf
piaware-config receiver-type other
piaware-config receiver-host $RECEIVER_HOST
piaware-config receiver-port $RECEIVER_PORT
piaware-config feeder-id $FEEDER_ID
piaware-config allow-mlat yes
piaware-config mlat-results yes
echo "mlat-results-format" $MLAT_RESULTS >> /etc/piaware.conf

piaware --plainlog