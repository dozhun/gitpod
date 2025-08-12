FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && apt-get update && \
    apt-get install -y \
      build-essential autoconf automake libtool make gcc g++ \
      zlib1g-dev libpthread-stubs0-dev libboost-all-dev samtools \
      python3.8 python3.8-dev python3.8-distutils python3-pip pkg-config git && \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/lib/x86_64-linux-gnu/pkgconfig/python-3.8.pc /usr/lib/x86_64-linux-gnu/pkgconfig/python3.pc
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
RUN ln -sf /usr/bin/python3.8-config /usr/bin/python3-config

ENV PYTHON=/usr/bin/python3

RUN ${PYTHON} -m pip install --upgrade pip setuptools wheel && \
    ${PYTHON} -m pip install pandas matplotlib sphinx tabulate

WORKDIR /opt

RUN git clone https://github.com/EI-CoreBioinformatics/portcullis.git && \
    cd portcullis && \
    ./autogen.sh && \
    ./configure --prefix=/opt/portcullis PYTHON=${PYTHON} && \
    make -j $(nproc) && \
    make install

ENV PATH=/opt/portcullis/bin:$PATH

CMD ["/bin/bash"]
