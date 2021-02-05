all: install

vendor: composer.json
	composer install

composer.lock: composer.json
	composer update

install: vendor composer.lock

.PHONY: all install
