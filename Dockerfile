# ELK stack: LogStash aggregation, Elastic Search for API, Kibana visualization
# docker@boot2docker:~$ docker build --tag="shentonfreude/elk:0.1"

MAINTAINER Chris Shenton <chris@shenton.org>

FROM ubuntu:14.04

# Config any non-standard repos, then do the update thang

RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo 'deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list

RUN apt-get update

# Java: needed by LogStash and Elastic Search
# Use OpenJDK instead of Oracle
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get -y install oracle-java7-installer

RUN apt-get -y install openjdk-7-jre-headless



###############################################################################
# LogStash
# Requires Java

RUN wget -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz

###############################################################################
# ElasticSearch

RUN apt-get -y install elasticsearch=1.1.1

# TODO:
# - fiddle /etc/elasticsearch/elasticsearch.yml and disable dynamic scripts
# - fix iptables to disallow world access to API

RUN service elasticsearch restart
RUN update-rc.d elasticsearch defaults 95 10


###############################################################################
# Kibana

RUN apt-get -y install kibana nginx