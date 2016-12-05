FROM elasticsearch
MAINTAINER Prussia <prussia.hu@gmail.com>
RUN plugin install elasticsearch/license/latest && plugin install elasticsearch/shield/latest && plugin install elasticsearch/marvel/latest
