FROM debian:jessie
MAINTAINER Wesley Blake <wesley@stratotechnology.com>

RUN apt-get update && apt-get -y install apache2 && apt-get clean
RUN apt-get -y install php5-common libapache2-mod-php5 php5-cli php5-mysql php5-openssl sendmail

RUN a2enmod rewrite
RUN a2enmod ssl

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /bin/ln -sf ../sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf


EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
