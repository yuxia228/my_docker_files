# my_docker_files
docker_files_collection

## How to build docker Image
```
docker build -t <name> <path to Dockerfile>
docker build -t yocto:1804 ./yocto_build/ubuntu_1804/
```

## How to run docker image
```
# If you want to use bash
docker-run.sh <name>
# If you want to run command/script once
docker-run.sh <name> <command/script>
# ex.)
docker-run.sh yocto:1804 ~/bin/xxxxx.sh
```

