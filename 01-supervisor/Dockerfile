FROM centos:centos6
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker 

#
# Supervisor
#
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python - && \
  rm /setuptools-5.4.1.zip && \
  easy_install pip && \
  pip install supervisor --pre && \
  mkdir -p /etc/supervisor/conf.d /var/log/supervisor && \
  cp /docker/supervisord.conf /etc/

CMD ["/usr/bin/supervisord", "-n" ]
