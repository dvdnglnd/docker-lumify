# docker-lumify

Lumify containerized

## Status

I have created a set of Dockerfiles that build on each other to load all software needed by Lumify. However, I think there is something wrong with the SSHD image possibly because the hostname changes between the build step and the run step. When I use the ssh-keyscan command I see the following:

```
$ ssh-keyscan  `hostname`
# MYHOSTNAME SSH-2.0-OpenSSH_5.3
no hostkey alg
```

I don't know why I am seeing the 'no hostkey alg' message.

## Build Images

```
cd 01-supervisor
./build_image.sh
cd ../02-java
./build_image.sh
cd ../03-nodejs
./build_image.sh
cd ../04-maven
./build_image.sh
cd ../05-sshd
./build_image.sh
```

# Run SSHD Image

```
cd 05-sshd
./run_image.sh
```

Now you can use nsenter to join the namespace of the container you just started. Once there you can create the host keys like this:

```
ssh-keygen -t rsa1 -P '' -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -t dsa  -P '' -f /etc/ssh/ssh_host_dsa_key
```

