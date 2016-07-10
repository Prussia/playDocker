FROM selenium/node-chrome:2.53.0
# MAINTAINER Prussia <prussia.hu@gmail.com>

USER root


ENV LANG C.UTF-8
ENV PYTHON_VERSION 2.7.12
ENV PYTHON_PIP_VERSION 8.1.2


#====================================
# Scripts to run Selenium Standalone
#====================================
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh

USER seluser

EXPOSE 4444