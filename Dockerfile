FROM elasticsearch:2.4
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin install elasticsearch/license/latest
RUN plugin install elasticsearch/kibana/latest
RUN plugin install elasticsearch/marvel/latest

#RUN plugin install elasticsearch/shield/latest 

