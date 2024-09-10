FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
COPY conf/mariadb.conf /etc/mysql/conf.d/50-server.cnf
COPY tools/script.sh /home/script.sh
RUN chmod -R 770 /var/lib/mysql
RUN chgrp -R mysql /var/lib/mysql
ENTRYPOINT /home/script.sh