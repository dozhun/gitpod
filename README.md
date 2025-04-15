# gitpod

In certain regions, pulling Docker images directly or cloning GitHub repositories can be challenging. As a straightforward alternative, creating Docker or Singularity images is an efficient solution. This repositories outlines general methods for seamlessly building functional Docker/SIF images using Gitpod’s cloud servers (e.g., Google Compute Engine).

## Register
create an account in gitpod(https://www.gitpod.io/flex-or-classic) follow the guide, choose Gitpod Classic as workspace, the host connect the real international inernet by default. 

## Save docker image tallball 

### pull docker image from dockhub create tarball file 

```shell
BIN_VERSION="1.6.1"
sudo docker pull google/deepvariant:"${BIN_VERSION}"
docker image save google/deepvariant:"${BIN_VERSION}" -o deepvariant-"${BIN_VERSION}".tar
```

### download docker image 
get SSH "access token" like 'ssh "xxxxxxxxx@xxxxxx"' in WorkSpace then 
login local host
```shell
scp -r "xxxxxxxxx@xxxxxx":/workspace/gitpod/deepvariant-"${BIN_VERSION}".tar .
```
### build sif iamge in local host
```shell
singularity build deepvariant-"${BIN_VERSION}" docker-archive://deepvariant-"${BIN_VERSION}".tar
```
## Build singularity sif image directly 
### install singularity in gitpod
```shell
git clone git@github.com:dozhun/gitpod.git 
cd gitpod/singularity
bash install 
```
### de novo config def file et al. 
a demo (not recommend for newfish)
```shell
mkdir nf-LO && cd nf-LO
curl -O https://raw.githubusercontent.com/evotools/nf-LO/main/singularity.def
curl -O https://raw.githubusercontent.com/evotools/nf-LO/main/environment.yml
singularity build nflo.sif singularity.def
```

### or build sif from docker hub directly
```shell
BIN_VERSION="1.6.1"
singularity build deepvariant-"${BIN_VERSION}".sif docker://google/deepvariant:"${BIN_VERSION}"
```


### download sif image 

login local machine 
```shell
BIN_VERSION="1.6.1"
scp -r "xxxxxxxxx@xxxxxx":/workspace/gitpod/deepvariant-"${BIN_VERSION}".sif .
```

## A network bridge to clone github repo
```shell
git clone https://github.com/chaozhi/PolyOriginR 
tar -czf PolyOriginR.tar.gz PolyOriginR
```
then login local machine 
```shell
scp -r "xxxxxxxxx@xxxxxx":/workspace/gitpod/PolyOriginR.tar.gz .
```
## Contact
dozhun@outlook.com(Zhang Jun)

