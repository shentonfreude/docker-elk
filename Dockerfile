# ELK stack: LogStash aggregation, Elastic Search for API, Kibana visualization
# docker@boot2docker:~$ docker build --tag="shentonfreude/elk:0.1" .

MAINTAINER Chris Shenton <chris@shenton.org>

FROM ubuntu:14.04

# Need wget early

RUN apt-get update
RUN apt-get -y install wget

# Config any non-standard repos, then do the update thang

RUN wget --quiet -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo 'deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list

RUN apt-get update

# Java: needed by LogStash and Elastic Search
# Use OpenJDK instead of Oracle
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get -y install oracle-java7-installer

RUN apt-get -y install openjdk-7-jre-headless=7u55-2.4.7-1ubuntu1


###############################################################################
# LogStash
# Requires Java

RUN wget --quiet https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz

###############################################################################
# ElasticSearch

RUN apt-get -y install elasticsearch=1.1.1

# TODO:
# - fiddle /etc/elasticsearch/elasticsearch.yml and disable dynamic scripts
# - fix iptables to disallow world access to API

RUN sudo service elasticsearch restart
RUN update-rc.d elasticsearch defaults 95 10


###############################################################################
# Kibana

# TODO, FAILS: invoke-rc.d: policy-rc.d denied execution of start.
RUN apt-get -y install nginx=1.4.6-1ubuntu3
# TBD: how to install kibana??

# EXPOSE ... web server 80 as 65080


#eof
