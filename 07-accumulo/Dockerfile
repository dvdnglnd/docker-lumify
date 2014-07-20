FROM medined/lumify-06-cloudera
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN useradd -g hadoop accumulo && \
  curl http://www.us.apache.org/dist/accumulo/1.5.1/accumulo-1.5.1-bin.tar.gz -O && \
  cd /usr/lib && \
  tar xzf /accumulo-1.5.1-bin.tar.gz && \
  rm /accumulo-1.5.1-bin.tar.gz && \
  ln -s accumulo-1.5.1 accumulo && \
  cp accumulo/conf/examples/1GB/standalone/* accumulo/conf && \
  chown -R accumulo:hadoop accumulo/ && \
  sed -i -e "s|HADOOP_PREFIX=/path/to/hadoop|HADOOP_PREFIX=/usr/lib/hadoop|" -e "s|JAVA_HOME=/path/to/java|JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre|" -e "s|ZOOKEEPER_HOME=/path/to/zookeeper|ZOOKEEPER_HOME=/usr/lib/zookeeper|" accumulo/conf/accumulo-env.sh && \
  sed -i -e "s|\$HADOOP_PREFIX/lib/[^.].*.jar|\$HADOOP_PREFIX/lib/[^.].*.jar,\n      \$HADOOP_PREFIX/share/hadoop/common/.*.jar,\n      \$HADOOP_PREFIX/share/hadoop/common/lib/.*.jar,\n      \$HADOOP_PREFIX/share/hadoop/hdfs/.*.jar,\n      \$HADOOP_PREFIX/share/hadoop/mapreduce/.*.jar,\n      \$HADOOP_PREFIX/share/hadoop/yarn/.*.jar,\n      /usr/lib/hadoop/.*.jar,\n      /usr/lib/hadoop/lib/.*.jar,\n      /usr/lib/hadoop-hdfs/.*.jar,\n      /usr/lib/hadoop-mapreduce/.*.jar,\n      /usr/lib/hadoop-yarn/.*.jar|" accumulo/conf/accumulo-site.xml && \
  sed -i -e "s|<configuration>|<configuration>\n  <property><name>instance.dfs.uri</name><value>hdfs://MYHOSTNAME:8020</value></property>|" accumulo/conf/accumulo-site.xml && \
  sed -i -e "s/localhost/MYHOSTNAME/" accumulo/conf/gc && \
  sed -i -e "s/localhost/MYHOSTNAME/" accumulo/conf/masters && \
  sed -i -e "s/localhost/MYHOSTNAME/" accumulo/conf/slaves && \
  sed -i -e "s/localhost/MYHOSTNAME/" accumulo/conf/tracers && \
  sed -i -e "s/localhost/MYHOSTNAME/" accumulo/conf/monitor && \
  echo "export ACCUMULO_HOME=/usr/lib/accumulo" > /etc/profile.d/accumulo-env.sh && \
  echo "export PATH=\$ACCUMULO_HOME/bin:\$PATH" >> /etc/profile.d/accumulo-env.sh

CMD ["/usr/bin/supervisord", "-n" ]
