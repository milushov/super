rspec:
	docker-compose run --rm app rspec $(ARGS)

# cr stands for Coverage Rspec.
# This 'open' command works on Mac only (if you dont have alias), sorry linux bro.
# You also have to set COVERAGE=true env variable in .env file or wherever you may
cr:
	docker-compose run --rm app rspec $(ARGS) && open coverage/index.html

rfailures:
	docker-compose run --rm app rspec --only-failures --fail-fast

rails:
	docker-compose run --rm app rails $(ARGS)

bundle:
	docker-compose run --rm app bundle $(ARGS)

# Same as bi, but with no arguments
bundle-install:
	docker-compose run --rm app bundle install -j8

bundle-and-restart: bundle-install restart

yarn-install:
	docker-compose run -it --rm app bash -c "yarn install"

be:
	docker-compose run --rm app bundle exec $(ARGS)

bi:
	docker-compose run --rm app bundle install $(ARGS)

.PHONY: bu
bu:
	docker-compose run --rm app bundle update $(ARGS)

.PHONY: buc
buc:
	docker-compose run --rm app bundle update --conservative $(ARGS)

.PHONY: bug
bug:
	docker-compose run --rm app bundle update --conservative --group $(ARGS)

clean-log:
	docker-compose run --rm app bundle exec rails log:clear

sprites:
	docker-compose run --rm app bin/rake slots:sprites

sh: bash

bash:
	docker-compose run -it --rm app bash

routes:
	docker-compose run --rm app rails routes | grep "$(ARGS)"

rc:
	docker-compose run --rm app rails console

rubocop:
	docker-compose run --rm app bundle exec rubocop $(ARGS)

# -T is for making this alias work:
# alias coplast='git show head --pretty="format:" --name-only | xargs make rubocop-correct'
rubocop-correct:
	docker-compose run -T --rm app bundle exec rubocop --autocorrect $(ARGS)

migration:
	docker-compose run --rm app rails generate migration $(ARGS)

rake:
	docker-compose run --rm app bundle exec rake "$(ARGS)"

active_record_doctor:
	docker-compose run --rm app bundle exec rails active_record_doctor

r:
	docker-compose run --rm app rails runner "$(ARGS)"

g:
	docker-compose run --rm app rails generate $(ARGS)

d:
	docker-compose run --rm app rails destroy $(ARGS)

zeitwerk-check:
	docker-compose run --rm app bundle exec rake zeitwerk:check

dbconsole: psql

creds-edit-prod:
	docker-compose run -it --rm app bash -c "EDITOR='vim' bin/rails credentials:edit --environment production"

creds-edit-dev:
	docker-compose run -it --rm app bash -c "EDITOR='vim' bin/rails credentials:edit --environment development"

creds-show-prod:
	docker-compose run -it --rm app bash -c "bin/rails credentials:show > config/credentials/production.yml --environment production"

creds-show-dev:
	docker-compose run -it --rm app bash -c "bin/rails credentials:show > config/credentials/development.yml --environment development"

.PHONY: rspec rails bundle be clean-log sh routes rc rubocop rapp migration rake bundle-install creds-edit creds-show yarn-install
