#!/bin/bash

wget https://www.sdrplay.com/software/SDRplay_RSP_API-Linux-3.07.1.run
chmod +x SDRplay_RSP_API-Linux-3.07.1.run
sh SDRplay_RSP_API-Linux-3.07.1.run --tar xvf

mv ./x86_64/sdrplay_apiService /usr/bin
mv ./x86_64/libsdrplay_api.so.3.07 /usr/local/lib
ln -s /usr/local/lib/libsdrplay_api.so.3.07 /usr/local/lib/libsdrplay_api.so.2
ln -s /usr/local/lib/libsdrplay_api.so.2 /usr/local/lib/libsdrplay_api.so

mv inc/* /usr/include/
ldconfig