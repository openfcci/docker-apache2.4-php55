FROM ubuntu:trusty
MAINTAINER Dustin Rue <dustin.rue@forumcomm.com>

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get -y install \
  apache2 \
  libapache2-mod-php5 \
  php5-mysql \
  php5-ldap \
  php5-gd \
  php5-curl \
  php5-memcached \
  php-pear 

EXPOSE 80
ADD run.sh usr/local/sbin/run.sh
RUN chmod 755 usr/local/sbin/run.sh

ENTRYPOINT ["run.sh"]
