#!/bin/bash
sudo DOCKER_HOST=$DOCKER_HOST docker build --rm=true -t medined/lumify-07-accumulo .
