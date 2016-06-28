FROM avatao/controller:ubuntu-14.04
MAINTAINER Gergo Turcsanyi <gergo.turcsanyi@avatao.com>

USER root

RUN apt-get update \
	&& apt-get install -qy mono-devel

COPY . /

RUN chown -R user:user /nunit

VOLUME ["/home/user", "/nunit/bin"]

USER user
