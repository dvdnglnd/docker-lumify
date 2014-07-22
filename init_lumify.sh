#!/bin/bash
su - hdfs -c 'hdfs dfs -mkdir /accumulo'
su - hdfs -c 'hdfs dfs -mkdir -p /user/accumulo'
su - hdfs -c 'hdfs dfs -chown accumulo:accumulo /accumulo'
su - hdfs -c 'hdfs dfs -chown accumulo:accumulo /user/accumulo'
su - accumulo -c 'accumulo init --instance-name lumify --password password
#
# Now that accumulo has been initialized, we can add the supervisor configuration file.
cp -vu /docker/supervisord-accumulo.conf /etc/supervisor/conf.d/accumulo.conf
