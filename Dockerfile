FROM medined/lumify-10-jetty
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

CMD ["/usr/bin/supervisord", "-n" ]

