FROM ubuntu:16.04
MAINTAINER Prussia <prussia.hu@gmail.com>

USER root

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser


ENV PYENV_ROOT /home/appuser/.pyenv
ENV PATH /home/appuser/.pyenv/shims:/home/appuser/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

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

WORKDIR /home/appuser/
USER appuser


CMD ["bash"]