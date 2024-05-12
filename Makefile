####
# DOCKER
####
docker_build:
	docker compose -f docker-compose.yml build

docker_run: docker_build
	docker compose -f docker-compose.yml up

docker_down:
	docker compose down --remove-orphans

docker_rebuild:
	docker compose -f docker-compose.yml build --no-cache

docker_bash:
	docker compose -f docker-compose.yml up --build bash

####
# Project
####
app:
	python /code/source/app.py my-command --a 1 --b 2

linting:
	ruff check source
	ruff check tests

unittests:
	rm -f tests/test_files/log.log
	# pytest tests
	coverage run -m pytest --durations=0 tests
	coverage html

tests: linting unittests

open_coverage:
	open 'htmlcov/index.html'
