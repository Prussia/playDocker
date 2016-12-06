FROM elasticsearch:2.4
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin -i elasticsearch/license/latest 
RUN plugin -i elasticsearch/shield/latest 
RUN plugin -i elasticsearch/marvel/latest
