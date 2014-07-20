FROM medined/lumify-04-maven
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker 

RUN yum install -y openssh openssh-server && \
  mkdir -p /var/run/sshd && \
  chmod 700 /var/run/sshd && \
  cp -v /docker/sshd-env.sh /etc/profile.d && \
  cp -v /docker/supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf

CMD ["/usr/bin/supervisord", "-n" ]

