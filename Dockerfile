FROM elasticsearch:1.7.6
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin install elasticsearch/license/latest 

RUN plugin install elasticsearch/shield/latest
