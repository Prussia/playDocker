FROM elasticsearch:1.7.6
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin -i elasticsearch/license/latest 
RUN plugin -i elasticsearch/shield/latest 
RUN plugin -i elasticsearch/marvel/latest

VOLUME /usr/share/elasticsearch/config
VOLUME /usr/share/elasticsearch/plugins
