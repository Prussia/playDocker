FROM tomcat:8.0-jre8
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
ENV JRE_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
ENV PATH $JAVA_HOME/bin:$PATH

#================================================
# Install Oracle JDK v8 JCE Policy
#================================================
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get -y -q install oracle-java8-unlimited-jce-policy

#============================
# Clean up
#============================
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.config/

WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]
