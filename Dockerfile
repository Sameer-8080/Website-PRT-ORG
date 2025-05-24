From ubuntu
RUN apt update
RUN apt intsall apache2 -y
ADD . /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
