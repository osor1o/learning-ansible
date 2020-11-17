FROM centos:8

RUN yum install -y openssh-server openssh-clients

EXPOSE 22
