FROM elasticsearch:2.4
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin install elastic/license/latest
RUN plugin install elastic/kibana/latest
RUN plugin install elastic/shield/latest 
RUN plugin install elastic/marvel/latest

