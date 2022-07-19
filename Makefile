.PHONY: all lint

all_tests: lint unittest integrationtest

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  lint			to run flake8 on all Python files"
	@echo "  unittest		to run unit tests on tedana_regressors"
	@echo "  integrationtest		to run integration tests"

lint:
	@flake8 tedana_regressors

unittest:
	@py.test -m "not integration" --cov-append --cov-report xml --cov-report term-missing --cov=tedana_regressors tedana_regressors

performancetest:
	@py.test -m "integration" --cov-append --cov-report xml --cov-report term-missing --cov=tedana_regressors tedana_regressors
