FROM medined/lumify-08-elasticsearch
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

#
# Storm
#
RUN curl http://www.us.apache.org/dist/incubator/storm/apache-storm-0.9.2-incubating/apache-storm-0.9.2-incubating.tar.gz -O && \
  cd /opt && \
  tar xzf /apache-storm-0.9.2-incubating.tar.gz && \
  rm /apache-storm-0.9.2-incubating.tar.gz && \
  ln -s apache-storm-0.9.2-incubating storm && \
  mkdir storm/logs && \
  echo "storm.zookeeper.servers:" >> /opt/storm/conf/storm.yaml && \
  echo " - MYHOSTNAME" >> /opt/storm/conf/storm.yaml && \
  echo "nimbus.host: MYHOSTNAME" >> /opt/storm/conf/storm.yaml && \
  echo "supervisor.slots.ports: [6700, 6701, 6702, 6703]" >> /opt/storm/conf/storm.yaml && \
  echo "ui.port: 8081" >> /opt/storm/conf/storm.yaml

CMD ["/usr/bin/supervisord", "-n" ]
