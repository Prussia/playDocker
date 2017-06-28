FROM buildpack-deps:jessie-curl
MAINTAINER Prussia <prussia.hu@gmail.com>

USER root

#================================================
# Customize sources for apt-get
#================================================

RUN apt-get update -qqy \
  && apt-get -qqy install build-essential wget unzip curl xz-utils zlib1g-dev libssl-dev
RUN apt-get install -y apt-transport-https

#================================================
# Install Oracle JDK v8
#================================================
RUN \
  apt-get update 1>/dev/null && \
  apt-get install -y --no-install-recommends software-properties-common 
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  

RUN \
  apt-get update 1>/dev/null && \
  apt-get install -y oracle-java8-set-default && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


RUN apt-get -y -q install oracle-java8-unlimited-jce-policy


#============================
# Clean up
#============================
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.config/

WORKDIR /root

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


CMD ["bash"]