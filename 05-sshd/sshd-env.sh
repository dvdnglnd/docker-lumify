#!/bin/bash

export HOME="/root"

if [ -e $HOME/.ssh_initialized ]
then
  echo "SSH Initialized"
else
  echo "Initializing SSH"
  ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key
  ssh-keygen -t dsa  -P '' -f /etc/ssh/ssh_host_dsa_key
  ssh-keygen -t rsa -P '' -f $HOME/.ssh/id_rsa
  cp -v /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
  chmod 600 /root/.ssh/authorized_keys
  ssh-keygen -t dsa -P '' -f $HOME/.ssh/id_dsa
  ssh-keyscan -t rsa `hostname` >> $HOME/.ssh/known_hosts
  ssh-keyscan -t dsa `hostname` >> $HOME/.ssh/known_hosts
  touch $HOME/.ssh_initialized
fi

#if [ "$(grep `hostname` $HOME/.ssh/known_hosts | grep ssh-dsa | wc -l)" == "0" ]
#then
#fi
