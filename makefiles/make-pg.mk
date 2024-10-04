psql:
	docker-compose run --rm pg psql "host=pg port=5432 dbname=super_development user=super-app password=super-app"

pg-bash:
	docker-compose run --rm pg bash

pg-sh: pg-bash
