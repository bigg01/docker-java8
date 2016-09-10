# java
# VERSION       Java 8
FROM centos:centos7
MAINTAINER Oliver Guggenbuehl, o.guggenbuehl@gmail.com

ENV JAVA_VERSION 8u101
ENV BUILD_VERSION b13


# Downloading Java
RUN yum -y install wget && \
    wget --no-cookies --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" && \
    -O /tmp/jdk-8-linux-x64.rpm && \
    yum -y install /tmp/jdk-8-linux-x64.rpm && \
    alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000 && \
    alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000 && \
    alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000 && \
    rm -rf /tmp/jdk-8-linux-x64.rpm && yum clean all

ENV JAVA_HOME /usr/java/latest


