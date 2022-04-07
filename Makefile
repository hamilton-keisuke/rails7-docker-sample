gi.PHONY: build
build:
	@docker-compose build

.PHONY: up
up:
	@docker-compose up -d

gi.PHONY: down
down:
	@docker-compose down

.PHONY: ps
ps:
	@docker-compose ps

.PHONY: bash
bash:
	@docker-compose exec rails bash

