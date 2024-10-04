db-create:
	docker-compose run --rm app rails db:create

db-reset:
	docker-compose run --rm app rails db:reset

db-migrate:
	docker-compose run --rm app rails db:migrate

db-rollback:
	docker-compose run --rm app rails db:rollback $(ARGS)

db-remigrate: db-rollback db-migrate

db-seed:
	docker-compose run --rm app rails db:seed

# rails db:drop works fine on 99% situations, but its better to remove volume if container gives errors (i.e. wrong data on pg update)
db-drop:
	docker volume ls -q | grep -q super_postgres && docker volume rm super_postgres || true
	docker-compose run --rm app rails db:drop

db-provision: db-create db-set-env db-migrate db-seed

db-only-reprovision: db-drop db-provision

# means you have already provisioned app where you worked for a while but you fucked up with data in postgres and want to fix this fast
db-reprovision: down db-only-reprovision up

db-set-env:
	RAILS_ENV=development docker-compose run --rm app rails db:environment:set RAILS_ENV=development

.PHONY: db-create db-reset db-migrate db-rollback db-remigrate db-seed db-drop db-provision db-only-reprovision db-reprovision db-set-env
