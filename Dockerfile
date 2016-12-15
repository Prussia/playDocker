FROM elasticsearch:1.7.6
MAINTAINER Prussia <prussia.hu@gmail.com>
RUN plugin -i elasticsearch/license/1.0.0 && plugin -i elasticsearch/shield/1.3.3

RUN cp -rf /etc/share/elasticsearch/shield /usr/share/elasticsearch/config/
RUN /usr/share/elasticsearch/bin/shield/esusers useradd admin -p admin 123 -r admin
RUN cp -rf /etc/share/elasticsearch/shield /usr/share/elasticsearch/config/
