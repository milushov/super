ARGS = $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

# TODO: move them to .dockerdev/makefiles/*.mk
# TODO: .PHONY for every action in all files
include ./makefiles/*.mk

build:
	DOCKER_BUILDKIT=1 docker build . --ssh default

up:
	docker-compose up --detach --remove-orphans

down:
	docker-compose down --remove-orphans

down-all:
	docker-compose down --volumes --remove-orphans --rmi all

# restart:
	# docker-compose restart $(ARGS)

restart: down up

init: copy-samples build bundle-install npm-install yarn-install db-provision up

# On every change, please, make sure this command is idempotent
reprovision: down build bundle-install npm-install db-provision db-provision up

# This command is used on some major updates, when old volumes are conflicting with new images or something like that
full-reprovision: down-all reprovision

copy-samples:
	if [ ! -f .env ]; then cp .env.sample .env; fi
	cp config/master.key.sample config/master.key
	cp config/database.yml.sample config/database.yml
	cp config/ngrok.yml.sample config/ngrok.yml
	cp docker-compose.override.yml.sample docker-compose.override.yml

# -> make log [SERVICE] (i.e. make log ws)
log:
	docker-compose logs -f $(ARGS)

# This is actually useful for debugging via Rubymine: you do `make stop app` and after that you run debug in Rubymine
stop:
	docker-compose stop $(ARGS)

kill:
	docker-compose kill $(ARGS)

.PHONY: build up down down-all restart reprovision copy-samples log stop kill init
