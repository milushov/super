# Requirements

Please ensure you are using Docker Compose V2. This project relies on the `docker compose` command, not the previous `docker-compose` standalone program.

https://docs.docker.com/compose/#compose-v2-and-the-new-docker-compose-command

Check your docker compose version with:
```
% docker compose version
Docker Compose version v2.10.2
```

## Initial setup
```
make init
```

### Magic command
```
make reprovision
```

## Recreate db
```
make db-only-reprovision
```

## Running the Rails app
```
make up
```

## Running the Rails console
When the app is already running with `docker-compose` up, attach to the container:
```
make rc
```

## Running tests
```
make rspec
```

## Updating gems
```
make bundle
```

## Updating creds
```
make creds-edit-dev
make creds-show-dev

make creds-edit-prod
make creds-show-prod
```

## Credits/References

* [Rails with Docker](https://github.com/ryanwi/rails7-on-docker)

