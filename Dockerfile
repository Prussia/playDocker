FROM elasticsearch:2.4.2
MAINTAINER Prussia <prussia.hu@gmail.com>
RUN plugin install elasticsearch/marvel/latest
RUN plugin install elasticsearch/shield/latest