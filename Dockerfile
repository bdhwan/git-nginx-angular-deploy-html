FROM ubuntu:18.04
LABEL maintainer=”bdhwan@gmail.com”

USER root
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get install -y apt-utils
RUN sudo apt-get install -y curl
RUN sudo apt-get install -y git
RUN sudo apt-get install -y vim
RUN sudo apt-get install -y nginx 
RUN sudo apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo npm install -g npm
RUN sudo npm install -g ionic
RUN sudo npm install -g cordova
RUN sudo npm install -g git-upload
RUN sudo npm install -g @angular/cli
RUN sudo npm install -g pm2
RUN sudo npm i -g cordova-res@0.6.0 --unsafe-perm
RUN cordova telemetry on

RUN rm -rf /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default
ADD check.sh /home/check.sh
RUN chmod 777 /home/check.sh
WORKDIR /home

EXPOSE 8080 80 443 3000 
HEALTHCHECK --interval=60s --timeout=3s --retries=60 CMD curl --fail http://localhost || exit 1
ENTRYPOINT ["/bin/sh", "check.sh"]






