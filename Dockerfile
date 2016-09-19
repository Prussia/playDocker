FROM ubuntu:16.04
MAINTAINER Prussia <prussia.hu@gmail.com>

USER root

#================================================
# Customize sources for apt-get
#================================================

RUN apt-get update -qqy \
  && apt-get -qqy install build-essential wget unzip curl xz-utils zlib1g-dev libssl-dev

# 
#================================================
# Install Oracle JDK v8
#================================================
RUN \
  apt-get update 1>/dev/null && \
  apt-get install -y --no-install-recommends software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update 1>/dev/null && \
  apt-get install -y --no-install-recommends oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#====================================================================================
# tomcat 8
#====================================================================================

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.37
ENV CATALINA_HOME /usr/local/tomcat
#ENV JAVA_OPTS "-Dfile.encoding=UTF-8 -Xms512m -Xmx512m -XX:MaxPermSize=256m"

RUN mkdir -p /usr/local/tomcat/

# INSTALL TOMCAT
RUN  wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat*/* $CATALINA_HOME 

#============================
# Clean up
#============================
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.config/

WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD [“catalina.sh", "run"]