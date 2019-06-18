FROM ubuntu:xenial

ENV cache_bust 1

RUN apt-get update

RUN apt-get -y install build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev qt5-default cmake python3-dev libboost-all-dev libeigen3-dev gawk curl libftdi-dev

RUN curl ftp://icarus.com/pub/eda/verilog/v10/verilog-10.2.tar.gz -o /tmp/iverilog.tar.gz

#git clone git://github.com/steveicarus/iverilog.git

RUN cd /tmp/ && tar -xpvzf iverilog.tar.gz && cd verilog-10.2 && ./configure && make install

RUN git clone https://github.com/YosysHQ/yosys.git /tmp/yosys
RUN cd /tmp/yosys && make config-clang && make && make install && make test

RUN git clone https://github.com/cliffordwolf/icestorm.git /tmp/icestorm

RUN cd /tmp/icestorm && make && make install

RUN git clone https://github.com/YosysHQ/nextpnr.git /tmp/nextpnr

RUN cd /tmp/nextpnr && cmake -DARCH=ice40 . && make && make install

# gtkwave - optional



