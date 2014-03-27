FROM ubuntu:latest
MAINTAINER Kyle Mathews "mathews.kyle@gmail.com"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN dpkg-divert --local --rename --add /sbin/initctl

# Setup locale http://stackoverflow.com/a/19114298/182702
RUN locale-gen en_US en_US.UTF-8

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install mongodb-10gen=2.4.9

VOLUME /data/db

EXPOSE 27017
ENTRYPOINT ["usr/bin/mongod", "--smallfiles"]
