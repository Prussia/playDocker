FROM elasticsearch:1.7.5
MAINTAINER Prussia <prussia.hu@gmail.com>
RUN plugin -i elasticsearch/license/1.0.0 && plugin -i elasticsearch/shield/1.3.3

RUN /usr/share/elasticsearch/bin/shield/esusers useradd admin -p prussia123 -r admin

RUN mkdir ./config/shield

RUN cp -rf /etc/elasticsearch/shield/* /usr/share/elasticsearch/config/shield