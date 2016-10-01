FROM ubuntu:trusty
MAINTAINER Dustin Rue <dustin.rue@forumcomm.com>

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get -y install \
  apache2 \
  libapache2-mod-php5 \
  memcached \
  php5-mysql \
  php5-ldap \
  php5-gd \
  php5-curl \
  php5-memcached \
  php-pear 

EXPOSE 80
ADD run.sh /run.sh
RUN ln -s /var/log/apache2 /etc/apache2/logs
RUN sed -i 's/memory_limit = 128M/memory_limit = 1280M/' /etc/php5/apache2/php.ini
RUN chmod 755 /run.sh
CMD ["run.sh"]
