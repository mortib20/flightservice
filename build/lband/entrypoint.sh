#!/bin/bash

rm -Rf /tmp/*
rm -Rf /tmp/.*

./password.exp $PASSWORD
vncserver $SCREEN -geometry $GEO

while true; do sleep 1; done
