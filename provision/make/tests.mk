test.help:
	@echo '    Tests:'
	@echo ''
	@echo '        test                      show help'
	@echo '        test.lint                 Run all pre-commit'
	@echo ''

test:
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	make test.help

test.lint:
	$(docker-dev-run) check sh -c "$(PIPENV_RUN) pre-commit run --all-files --verbose"
