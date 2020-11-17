FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install openssh-server -y
RUN service ssh start

EXPOSE 22
