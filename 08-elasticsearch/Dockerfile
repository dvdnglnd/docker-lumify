FROM medined/lumify-07-accumulo
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN useradd -g hadoop esearch && \
  curl https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.2.tar.gz -O && \
  cd /usr/lib && \
  tar xzf /elasticsearch-1.1.2.tar.gz && \
  rm /elasticsearch-1.1.2.tar.gz && \
  ln -s elasticsearch-1.1.2 elasticsearch && \
  chown -R esearch:hadoop elasticsearch/ && \
  elasticsearch/bin/plugin install org.securegraph/securegraph-elasticsearch-plugin/0.6.0 && \
  elasticsearch/bin/plugin install mobz/elasticsearch-head

CMD ["/usr/bin/supervisord", "-n" ]
