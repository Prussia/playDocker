FROM elasticsearch
MAINTAINER Prussia <prussia.hu@gmail.com>
RUN plugin -i elasticsearch/license/latest && plugin -i elasticsearch/shield/latest && plugin -i elasticsearch/marvel/latest
