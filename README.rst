============
 Docker ELK
============

I want to learn Docker by deploying an ELK stack (ElasticSearch,
LogStash, Kibana), and I want each of them all in their own
containers. I probably should start by putting them all in the same
container.

ELK Stack
=========

For code that needs java, try OpenJDK, after getting it working with
Oracle Java (using a new apt repo)


LogStash: log aggregator, processor
-----------------------------------

Requires: Java(?)

Writes to ElasticSearch

LogStash Forwarder: on log sender boxes
---------------------------------------

Requires: what?
We can tweak syslog.conf to send for now


ElasticSearch: search, API for Kibana
-------------------------------------

Requires: Java

Is populated from LogStash

Kibana: web visualization
-------------------------

Requires: Nginx or Apache

Reads from ElasticSearch API



Build and Image
===============

http://docs.docker.com/userguide/dockerimages/

