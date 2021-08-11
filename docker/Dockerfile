FROM registry.access.redhat.com/ubi8
LABEL maintainer="PR electronics A/S"
USER root
RUN yum update --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos -y && rm -rf /var/cache/yum
RUN yum install --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos make python36 python38 python39 -y && rm -rf /var/cache/yum
RUN alternatives --set python /usr/bin/python3.8
RUN useradd -m -s $(which bash) prdev && mkdir /app && chown prdev:prdev /app && echo "export PS1='\$(whoami)@ [\$(pwd)]# '" >> /etc/bashrc
ENV TERM xterm-256color

USER prdev

#ADD --chown=prdev:prdev "." "/app"