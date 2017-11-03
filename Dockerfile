FROM avatao/controller:ubuntu-16.04
MAINTAINER Gergo Turcsanyi <gergo.turcsanyi@avatao.com>

USER root

RUN apt-get update \
	&& apt-get install -qy mono-devel

COPY ./ /

RUN adduser --disabled-password --gecos ',,,' --uid 2000 controller \
	&& chown -R controller:controller /home/user/App /nunit \
	&& chown root:root /home/user/App/App/App.csproj /home/user/App/Test/Test.csproj \
	&& chown root:root /home/user/App/App.sln /home/user/App/Test/Test.cs \
	&& cd /home/user/App \
	&& find . -type f -exec chmod 744 {} +

VOLUME ["/nunit/bin"]
