FROM elasticsearch:1.7.6
RUN plugin -i elasticsearch/license/1.3 && plugin -i elasticsearch/shield/1.3