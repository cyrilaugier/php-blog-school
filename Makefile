include config.mk

all: install

vendor: composer.json
	composer install

composer.lock: composer.json
	composer update

install: vendor composer.lock

lint: install
	php ./vendor/bin/phpcs -p --colors --standard=$(RULES) $(SOURCES)

server:
	php -S 127.0.0.1:$(PORT) -t $(SOURCES) -d display_errors="$(DISPLAY_ERRORS)" \
		-d error_reporting="$(ERROR_REPORTING)"

.PHONY: all install lint server
