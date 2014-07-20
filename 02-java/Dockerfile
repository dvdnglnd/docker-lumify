FROM medined/lumify-01-supervisor
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN yum install -y java-1.6.0-openjdk && \
  echo "export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre" > /etc/profile.d/java-env.sh && \
  echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile.d/java-env.sh

CMD ["/usr/bin/supervisord", "-n" ]
