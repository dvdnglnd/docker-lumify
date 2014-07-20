FROM medined/lumify-04-maven
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker 

RUN yum install -y openssh openssh-server && \
  ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa && \
  ssh-keygen -t rsa1 -P '' -f /etc/ssh/ssh_host_rsa_key && \
  ssh-keygen -t dsa  -P '' -f /etc/ssh/ssh_host_dsa_key && \
  echo "AAAA $(hostname) AAAA" && \
  ssh-keyscan -t dsa `hostname` >> /root/.ssh/known_hosts && \
  ssh-keyscan -t rsa `hostname` >> /root/.ssh/known_hosts && \
  cp -v /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
  chmod 600 /root/.ssh/authorized_keys && \
  mkdir -p /var/run/sshd && \
  chmod 700 /var/run/sshd && \
  cp /docker/supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf

CMD ["/usr/bin/supervisord", "-n" ]

