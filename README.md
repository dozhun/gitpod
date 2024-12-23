# gitpod
Learn how to use the Gitpod debugging environment.
Effortlessly Build Functional docker/SIF Images via Cloud Server(Google Compute Engine et al.)

## pull docker image from dockhub  and create tarball file 

```shell
BIN_VERSION="1.6.1"
sudo docker pull google/deepvariant:"${BIN_VERSION}"
docker image save google/deepvariant:"${BIN_VERSION}" -o deepvariant-"${BIN_VERSION}".tar
```

## singularity sif image build
```shell
mkdir nf-LO && cd nf-LO
curl -O https://raw.githubusercontent.com/evotools/nf-LO/main/singularity.def
curl -O https://raw.githubusercontent.com/evotools/nf-LO/main/environment.yml
singularity build nflo.sif singularity.def
```

### config and install singularity
```shell
cd singularity
bash install 
```

### or build sif from docker hub directly
```shell
BIN_VERSION="1.6.1"
singularity build deepvariant-"${BIN_VERSION}".sif docker://google/deepvariant:"${BIN_VERSION}"
```


### download file 
cp `access Token` in gitpod workspaces like 'ssh "xxxxxxxxx@xxxxxx"' \n
login local machine 
```shell
scp -r "xxxxxxxxx@xxxxxx":/workspace/gitpod/docker.tar .
```

### a network bridge to clone github repo
```shell
git clone https://github.com/chaozhi/PolyOriginR 
tar -czf PolyOriginR.tar.gz PolyOriginR
```
the login local machine 
```shell
scp -r "xxxxxxxxx@xxxxxx":/workspace/gitpod/PolyOriginR.tar.gz .
```
