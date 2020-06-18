FROM ubuntu:latest

MAINTAINER github.com/Helamorious

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /etc/

RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get install -y bind9 isc-dhcp-server

ADD conf/run.sh /

ENTRYPOINT ["/bin/bash"]
