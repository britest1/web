FROM debian:jessie

MAINTAINER Zakaria NAOURA <z.naoura@wakeonweb.com>
ENV DEBIAN_FRONTEND noninteractive
COPY ./install /install
RUN set -x

# Install base packages
COPY ./install/sources.list /etc/apt/sources.list
RUN /bin/bash /install/global.sh

# Apache
# ENV HTTPD_VERSION 2.2.34
# ENV HTTPD_PREFIX /usr/local/apache2
# ENV PATH $HTTPD_PREFIX/bin:$PATH
# ENV HTTPD_SHA256 e53183d5dfac5740d768b4c9bea193b1099f4b06b57e5f28d7caaf9ea7498160
# ENV HTTPD_PATCHES="CVE-2017-9798-patch-2.2.patch 42c610f8a8f8d4d08664db6d9857120c2c252c9b388d56f238718854e6013e46"
# ENV APACHE_DIST_URLS https://www.apache.org/dyn/closer.cgi?action=download&filename= https://www-us.apache.org/dist/ https://www.apache.org/dist/ https://archive.apache.org/dist/
# COPY ./install/httpd-foreground /usr/local/bin/
# RUN /bin/bash /install/apache-official.sh
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
RUN /bin/bash /install/apache.sh
WORKDIR /var/www/vhosts
EXPOSE 80
EXPOSE 443

# NodeJS
ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 8.7.0
ENV YARN_VERSION 1.2.0
RUN /bin/bash /install/nodejs.sh
