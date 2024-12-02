# Ensure repositories are up-to-date
sudo apt-get update
# Install debian packages for dependencies
sudo apt-get install -y \
    autoconf \
    automake \
    cryptsetup \
    fuse2fs \
    git \
    fuse \
    libfuse-dev \
    libglib2.0-dev \
    libseccomp-dev \
    libtool \
    pkg-config \
    runc \
    squashfs-tools \
    squashfs-tools-ng \
    uidmap \
    wget \
    zlib1g-dev


#wget https://go.dev/dl/go1.23.3.linux-amd64.tar.gz
# Remove any previous Go installation
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz
# Add /usr/local/go/bin to the PATH environment variable.
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc && \
source ~/.bashrc



wget https://github.com/sylabs/singularity/releases/download/v4.2.1/singularity-ce-4.2.1.tar.gz
tar -zxf singularity-ce-4.2.1.tar.gz 
cd singularity-ce-4.2.1/
./mconfig --without-suid
make -C builddir
sudo make -C builddir install
singularity --version 
./mconfig -b ./buildtree -p /usr/local

cd .. && rm -rf singularity-ce-4.2.1/
