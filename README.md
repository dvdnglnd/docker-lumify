# docker-lumify

Lumify containerized

## Issues

The mapred user does not have password-less SSH but I'm not sure that it is needed nor do I know why it is not working. The hdfs user does have password-less SSH.

## Status

I have created a set of Dockerfiles that build on each other to load all software needed by Lumify. 

NOTE: The project is not complete. I am working to get the cloudera image to work properly. 

## Build Images

There is one script file to build the many images needed for lumify.

```
./build_image.sh
```

# Run Image

This part is still under development.

