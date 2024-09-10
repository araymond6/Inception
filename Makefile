DC=srcs/docker-compose.yml #DC for Docker Compose
.PHONY: all up down re clean fclean start stop nginx mariadb wordpress run-nginx run-mariadb run-wordpress

all: up

nginx:
	docker build -t nginx srcs/requirements/nginx

run-nginx: nginx
	docker run -it nginx

mariadb:
	docker build -t mariadb srcs/requirements/mariadb

run-mariadb: mariadb
	docker run -it mariadb

wordpress:
	docker build -t wordpress srcs/requirements/wordpress

run-wordpress: wordpress
	docker run -it wordpress

up:
	docker compose -f $(DC) up --build -d

stop:
	docker compose -f $(DC) stop

down:
	docker compose -f $(DC) down -v

re: fclean all

clean:
	docker system prune -af

fclean: stop down clean