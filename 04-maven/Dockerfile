FROM medined/lumify-03-nodejs
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN yum install -y tar && \
  curl http://archive.apache.org/dist/maven/binaries/apache-maven-3.0.5-bin.tar.gz -O && \
  cd /opt && \
  tar xzf /apache-maven-3.0.5-bin.tar.gz && \
  rm /apache-maven-3.0.5-bin.tar.gz && \
  ln -s apache-maven-3.0.5 maven && \
  echo "export MVN_HOME=/opt/maven" > /etc/profile.d/maven-env.sh && \
  echo "export PATH=\$MVN_HOME/bin:\$PATH" >> /etc/profile.d/maven-env.sh

CMD ["/usr/bin/supervisord", "-n" ]
