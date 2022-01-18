FROM ubuntu:focal

RUN apt-get update
RUN apt-get install git gcc g++ make libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev libzstd-dev vim wget -y
RUN git clone https://github.com/facebook/rocksdb.git
WORKDIR rocksdb
RUN make static_lib -j $(nproc)
WORKDIR examples
RUN make all
RUN mkdir /test
WORKDIR /test
RUN wget https://github.com/innerout/rocksdb-docker/blob/main/Makefile
RUN wget https://raw.githubusercontent.com/innerout/rocksdb-docker/main/test.cpp
