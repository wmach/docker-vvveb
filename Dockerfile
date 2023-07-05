FROM php:7.2-apache
RUN apt-get -y update
RUN apt-get install -y \
    curl \
    gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
# RUN npm install npm@latest -g
RUN npm install -g gulp
RUN npm uninstall node-sass
RUN npm install sass

