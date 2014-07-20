FROM medined/lumify-02-java
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN rpm -ivH http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
  yum --enablerepo centosplus install -y git nodejs npm && \
  npm install -g bower inherits grunt grunt-cli

CMD ["/usr/bin/supervisord", "-n" ]
