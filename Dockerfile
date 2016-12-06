FROM elasticsearch:2.4
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin -i elastic/license/latest
RUN plugin -i elastic/kibana/latest
RUN plugin -i elastic/shield/latest 
RUN plugin -i elastic/marvel/latest

