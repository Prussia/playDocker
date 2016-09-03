FROM ubuntu:16.04
MAINTAINER Prussia <prussia.hu@gmail.com>

USER root

ENV PYENV_ROOT /root/.pyenv
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

#================================================
# Customize sources for apt-get
#================================================

RUN apt-get update -qqy \
  && apt-get -qqy install \
  git mercurial build-essential libssl-dev libbz2-dev libreadline-dev libsqlite3-dev curl

#================================================
# Install pyenv
#================================================

RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash


#============================
# Clean up
#============================
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.config/

WORKDIR /data

CMD ["bash"]