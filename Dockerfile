FROM python:2.7
# File Author
# MAITAINER Prussia Hu

USER root


ENV PYTHON_VERSION 2.7.12

RUN pip install -I selenium==2.53.6 unittest-xml-reporting==2.1.0

#============================
# Clean up
#============================
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.config/google-chrome



