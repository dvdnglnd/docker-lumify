FROM medined/lumify-05-sshd
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN curl http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm -O && \
  rpm -ivH cloudera-cdh-4-0.x86_64.rpm && \
  yum install -y hadoop-0.20-conf-pseudo zookeeper-server && \
  rm /cloudera-cdh-4-0.x86_64.rpm && \
  mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/{name,namesecondary,data} && \
  chown hdfs:hadoop /var/lib/hadoop-hdfs/cache/hdfs/dfs/{name,namesecondary,data} && \
  service zookeeper-server init && \
  sed -i -e "s/localhost:8020/MYHOSTNAME:8020/" /usr/lib/hadoop/etc/hadoop/core-site.xml && \
  sed -i -e "s^<configuration>^<configuration>\n  <property><name>dfs.permissions.enabled</name><value>false</value></property>\n  <property><name>dfs.datanode.synconclose</name><value>true</value></property>^" /usr/lib/hadoop/etc/hadoop/hdfs-site.xml && \
  chown -R hdfs:hadoop /usr/lib/hadoop /usr/lib/hadoop-hdfs && \
  /usr/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
  echo "LC_CTYPE=\"en_US.UTF-8\"" >> /etc/sysconfig/i18n && \
  echo "export HADOOP_PREFIX=/usr/lib/hadoop" > /etc/profile.d/hadoop-env.sh && \
  echo "export HADOOP_LIBEXEC_DIR=/usr/lib/hadoop/libexec" >> /etc/profile.d/hadoop-env.sh && \
  echo "export PATH=\$HADOOP_PREFIX/bin:\$PATH" >> /etc/profile.d/hadoop-env.sh && \
  echo "export ZOOKEEPER_HOME=/usr/lib/zookeeper" > /etc/profile.d/zookeeper-env.sh && \
  echo "export PATH=\$ZOOKEEPER_HOME/bin:\$PATH" >> /etc/profile.d/zookeeper-env.sh && \
  cp /docker/supervisord-zookeeper.conf /etc/supervisor/conf.d/supervisord-zookeeper.conf && \
  cp /docker/supervisord-hdfs.conf /etc/supervisor/conf.d/supervisord-hdfs.conf && \
  chmod g+w /usr/lib/hadoop

USER hdfs

RUN hdfs namenode -format

USER root

CMD ["/usr/bin/supervisord", "-n" ]
