FROM elasticsearch:2.4
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin install license
RUN plugin install shield
RUN plugin install marvel-agent

