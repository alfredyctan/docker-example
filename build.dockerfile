FROM ubuntu:16.04

RUN apt update

ENV TZ Asia/Hong_Kong
RUN echo "$TZ" > /etc/timezone; \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime; \
    apt install tzdata; \
    dpkg-reconfigure -f noninteractive tzdata

ENV OWNER ubuntu
ENV GROUP ubuntu

RUN groupadd -g 500 $GROUP && useradd -m -r -u 1000 -g $GROUP $OWNER

#install dependency for FDSLoader

WORKDIR /opt/sys/app/test/instance
ADD start.sh .
ADD .bash_profile /home/$OWNER/
RUN find . -exec chown -R $GROUP:$USER {} \;
RUN find . -name '*.sh' -exec chmod 750 {} \;

VOLUME /tmp

USER $OWNER

CMD ["/bin/bash", "-c", "source ~/.bash_profile; ./start.sh;"]
