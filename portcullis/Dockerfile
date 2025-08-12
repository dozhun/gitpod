FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 基础构建工具和依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    make \
    autoconf \
    automake \
    libtool \
    zlib1g-dev \
    libpthread-stubs0-dev \
    libboost-all-dev \
    libbz2-dev \
    liblzma-dev \
    pkg-config \
    curl \
    git \
    wget \
    unzip \
    python3 \
    python3-all-dev \
    python3-pip \
    python3-setuptools \
    samtools \
    && rm -rf /var/lib/apt/lists/*

# Python依赖
RUN pip3 install --no-cache-dir \
    pandas \
    matplotlib \
    sphinx \
    tabulate

# 安装Portcullis
WORKDIR /opt
ENV PYTHON=python3
RUN git clone https://github.com/EI-CoreBioinformatics/portcullis.git && \
    cd portcullis && \
    ./autogen.sh && \
    ./configure --prefix=/opt/portcullis PYTHON=${PYTHON} && \
    make -j $(nproc) && \
    make check && \
    make install

# 将Portcullis加入PATH
ENV PATH="/opt/portcullis/bin:${PATH}"

# 默认工作目录
WORKDIR /data
