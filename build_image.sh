#!/bin/bash
hash nsenter 2>/dev/null || { echo >&2 "Installing nsenter"; sudo DOCKER_HOST=$DOCKER_HOST docker run -v /usr/local/bin:/target jpetazzo/nsenter;  }
pushd 01-supervisor;    ./build_image.sh; popd
pushd 02-java;          ./build_image.sh; popd
pushd 03-nodejs;        ./build_image.sh; popd
pushd 04-maven;         ./build_image.sh; popd
pushd 05-sshd;          ./build_image.sh; popd
pushd 06-cloudera;      ./build_image.sh; popd
pushd 07-accumulo;      ./build_image.sh; popd
pushd 08-elasticsearch; ./build_image.sh; popd
pushd 09-storm;         ./build_image.sh; popd
pushd 10-rabbitmq;      ./build_image.sh; popd
pushd 11-jetty;         ./build_image.sh; popd

####
# Hadoop needs to be running in order to initialize Accumulo. Therefore we need to 
# spinup an uninitialized container. It has zookeeper and hadoop running.
#
# The hostname is specified so that we can use pre-created hadoop configuration files. 
####
#sudo DOCKER_HOST=$DOCKER_HOST docker run -d --name=accbuild -h=MYHOSTNAME -p=127.0.0.10:2244:22 medined/lumify-10-jetty
#sleep 5

#PID=$(DOCKER_HOST=$DOCKER_HOST docker inspect --format {{.State.Pid}} accbuild)
#sudo nsenter --target $PID --mount --uts --ipc --net --pid /docker/init_lumify.sh

#IGNORE=$(sudo DOCKER_HOST=$DOCKER_HOST docker commit --author="David Medinets <david.medinets@gmail.com>" accbuild medined/docker-lumify)
#IGNORE=$(sudo DOCKER_HOST=$DOCKER_HOST docker stop accbuild || :)
#IGNORE=$(sudo DOCKER_HOST=$DOCKER_HOST docker rm accbuild || :)

