FROM centos:8

ARG SSH_MASTER_USER
ARG SSH_MASTER_PASS

RUN yum update -y

RUN yum install -y \
    nano \
    sudo \
    openssh-server

COPY dockerfiles/ssh_config /etc/ssh/ssh_config
COPY dockerfiles/sshd_config /etc/ssh/sshd_config

COPY dockerfiles/user.sh /usr/local/bin/user.sh
RUN chmod +x /usr/local/bin/user.sh
RUN /usr/local/bin/user.sh

COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD tail -f /dev/null
