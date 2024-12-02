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
cp `access Token` in gitpod workspaces like 'ssh "xxxxxxxxx@xxxxxx"'
login local machine 
```shell
scp -r "xxxxxxxxx@xxxxxx":/workspace/gitpod/docker.tar .
```