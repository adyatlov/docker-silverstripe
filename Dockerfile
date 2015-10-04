FROM debian:wheezy
MAINTAINER Andrey Dyatlov <adyatlov@gmail.com>

### SET UP

# BASE wheezy-backports O/S with some helpful tools
RUN echo "deb http://ftp.us.debian.org/debian wheezy-backports main" >> /etc/apt/sources.list
RUN apt-get -qq update

RUN apt-get -qqy install sudo wget lynx telnet nano curl make git-core locales

RUN echo "LANG=en_US.UTF-8\n" > /etc/default/locale && \
	echo "en_US.UTF-8 UTF-8\n" > /etc/locale.gen && \
	locale-gen

# Known hosts
ADD known_hosts /root/.ssh/known_hosts

# APACHE, MYSQL, PHP & SUPPORT TOOLS
RUN apt-get -qqy install apache2 mysql-server-5.5 \
	php5-cli libapache2-mod-php5 php5-mysqlnd php5-mcrypt php5-tidy php5-curl php5-gd php-pear

#  - Phpunit, Composer, Phing
RUN wget https://phar.phpunit.de/phpunit-3.7.37.phar && \
	chmod +x phpunit-3.7.37.phar && \
	mv phpunit-3.7.37.phar /usr/local/bin/phpunit && \
	wget https://getcomposer.org/composer.phar && \
	chmod +x composer.phar && \
	mv composer.phar /usr/local/bin/composer && \
	pear channel-discover pear.phing.info && \
	pear install phing/phing

# Update Composer
RUN /usr/local/bin/composer self-update

# SilverStripe Apache Configuration
RUN a2enmod rewrite && \
	rm /var/www/index.html && \
	echo "date.timezone = Europe/Berlin" > /etc/php5/conf.d/timezone.ini

ADD start.sh /usr/local/bin/start.sh
ADD new.sh /usr/local/bin/new.sh
ADD apache-default-vhost /etc/apache2/sites-available/default
ADD _ss_environment.php /var/_ss_environment.php

####
## Commands and ports	
EXPOSE 80

WORKDIR /var/www

ENV LANG en_US.UTF-8
