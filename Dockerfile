FROM ubuntu:18.04

# installing dependencies
RUN apt-get update && apt-get install -y git libtool autoconf automake pkg-config bison openssl flex python-dev software-properties-common

# install java
RUN apt-get install -y openjdk-8-jre-headless ant

# cloning modified thrift source code
RUN cd /tmp && git clone https://github.com/guardian/french-thrift.git

# compiling and installing thrift binaries
RUN cd /tmp/french-thrift && ./bootstrap.sh && ./configure
RUN cd /tmp/french-thrift && make install
RUN rm -Rf /tmp/french-thrift

# version check
RUN thrift -version
RUN mkdir /data
WORKDIR "/data"
