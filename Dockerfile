FROM avatao/controller:ubuntu-14.04
MAINTAINER Gergo Turcsanyi <gergo.turcsanyi@avatao.com>

USER root

RUN apt-get update \
	&& apt-get install -qy mono-devel

COPY ./ /

RUN adduser --disabled-password --gecos ',,,' controller \
	&& chown -R controller:controller /nunit /home/user/App \
	&& cd /home/user/App \
	&& find . -type f -exec chmod 744 {} +

VOLUME ["/nunit/bin"]
