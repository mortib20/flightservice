#!/bin/bash

rm /tmp/*
rm /tmp/.*

./password.exp $PASSWORD
vncserver $SCREEN -geometry $GEO

while true; do sleep 1; done