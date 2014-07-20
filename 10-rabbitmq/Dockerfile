FROM medined/lumify-09-storm
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN useradd -g hadoop rabbitmq && \
  export HOME=/home/rabbitmq && \
  yum install -y erlang && \
  curl http://www.rabbitmq.com/releases/rabbitmq-server/v3.2.3/rabbitmq-server-3.2.3-1.noarch.rpm -O && \
  rpm -ivH rabbitmq-server-3.2.3-1.noarch.rpm && \
  rm /rabbitmq-server-3.2.3-1.noarch.rpm && \
  /usr/sbin/rabbitmq-plugins enable rabbitmq_management && \
  chown -R rabbitmq:hadoop /home/rabbitmq/.erlang.cookie && \
  service rabbitmq-server restart

CMD ["/usr/bin/supervisord", "-n" ]
