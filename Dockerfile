FROM ubuntu
RUN apt update -y
RUN apt install apache2 -y
ENTRYPOINT apachectl -D FOREGROUND
ADD . /var/www/html
