FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt


RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    tar \
    unzip \
    git \
    python3 \
    python3-pip \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/lh3/minimap2.git && \
    cd minimap2 && make && \
    cp minimap2 /usr/local/bin/ && \
    cd .. && rm -rf minimap2


RUN git clone https://github.com/DaehwanKimLab/hisat2.git && \
    cd hisat2 && make && \
    cp hisat2-* /usr/local/bin/ && \
    cd .. && rm -rf hisat2


COPY EviAnn-2.0.3.tar.gz /opt/
RUN tar xvzf EviAnn-2.0.3.tar.gz && \
    cd EviAnn-2.0.3 && \
    ./install.sh && \
    ln -s /opt/EviAnn-2.0.3/bin/eviann.sh /usr/local/bin/eviann.sh


ENV PATH="/opt/EviAnn-2.0.3/bin:${PATH}"

WORKDIR /data
ENTRYPOINT ["eviann.sh"]
