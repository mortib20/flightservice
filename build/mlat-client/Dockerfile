FROM alpine:latest AS build
WORKDIR /build/
RUN apk add git libc-dev gcc python3 python3-dev && \
git clone https://github.com/wiedehopf/mlat-client

WORKDIR /build/mlat-client/
RUN python3 -m venv . && \
source ./bin/activate && \
python3 setup.py build

FROM alpine:latest AS main
WORKDIR /build/mlat-client
RUN apk add python3
COPY --from=build /build/ /build/
COPY ./start.sh /start.sh
RUN source ./bin/activate && \
python3 setup.py install

CMD ["/bin/sh", "/start.sh"]