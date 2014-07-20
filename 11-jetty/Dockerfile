FROM medined/lumify-10-rabbitmq
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN curl -L 'http://eclipse.org/downloads/download.php?file=/jetty/stable-8/dist/jetty-distribution-8.1.15.v20140411.tar.gz&r=1' -o jetty-distribution-8.1.15.v20140411.tar.gz && \
  cd /opt && \
  tar xzf /jetty-distribution-8.1.15.v20140411.tar.gz && \
  rm /jetty-distribution-8.1.15.v20140411.tar.gz && \
  ln -s jetty-distribution-8.1.15.v20140411 jetty && \
  mkdir -p /opt/lumify/config && \
  keytool -genkeypair -keysize 2048 -keyalg RSA -keypass password -storepass password -dname CN=lumify -keystore /opt/lumify/config/jetty.jks && \
  sed -i -e "s|</Call>|</Call>\n    <Call name="addConnector">\n      <Arg>\n        <New class="org.eclipse.jetty.server.ssl.SslSelectChannelConnector">\n          <Arg>\n            <New class="org.eclipse.jetty.http.ssl.SslContextFactory">\n              <Set name="keyStore">/opt/lumify/config/jetty.jks</Set>\n              <Set name="keyStorePassword">password</Set>\n              <Set name="trustStore">/opt/lumify/config/jetty.jks</Set>\n              <Set name="trustStorePassword">password</Set>\n              <Set name="needClientAuth">false</Set>\n            </New>\n          </Arg>\n          <Set name="host"><Property name="jetty.host" /></Set>\n          <Set name="port"><Property name="jetty.port" default="8443"/></Set>\n          <Set name="maxIdleTime">300000</Set>\n          <Set name="Acceptors">2</Set>\n          <Set name="statsOn">false</Set>\n          <Set name="lowResourcesConnections">20000</Set>\n          <Set name="lowResourcesMaxIdleTime">5000</Set>\n        </New>\n      </Arg>\n    </Call>|" jetty/etc/jetty.xml && \
  mkdir -p jetty/contexts-DISABLED && \
  mv jetty/contexts/* jetty/contexts-DISABLED && \
  mkdir -p jetty/webapps-DISABLED && \
  mv jetty/webapps/* jetty/webapps-DISABLED

CMD ["/usr/bin/supervisord", "-n" ]

