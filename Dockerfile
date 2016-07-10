FROM python:2.7
# File Author
# MAITAINER Prussia Hu

USER root


ENV PYTHON_VERSION 2.7.12

#============================
# Clean up
#============================
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.config/google-chrome



