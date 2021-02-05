include config.mk

all: install

vendor: composer.json
	composer install

composer.lock: composer.json
	composer update

install: vendor composer.lock

lint: install
	php ./vendor/bin/phpcs -p --colors --standard=$(RULES) $(SOURCES)

.PHONY: all install lint
