FROM buildpack-deps:jessie-scm
MAINTAINER Prussia <prussia.hu@gmail.com>

USER root

RUN  apt-get update  &&  apt-get install -qqy --no-install-recommends software-properties-common 
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
  
RUN apt-get update && \
  apt-get install -qqy  oracle-java8-set-default && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

WORKDIR /root
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


CMD ["bash"]