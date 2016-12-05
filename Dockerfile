FROM elasticsearch
MAINTAINER Prussia <prussia.hu@gmail.com>

RUN plugin install elasticsearch/license/latest && plugin install elasticsearch/shield/latest

VOLUME /usr/share/elasticsearch/config

VOLUME /usr/share/elasticsearch/plugins
