export PYTHONPATH = $(shell pwd)
styletest:
	pep8 yaml_model.py test
	pylint --rcfile pylint-main.conf yaml_model.py
	pylint --rcfile pylint-test.conf test/*.py

unittest:
	py.test --cov yaml_model test

test: styletest unittest

.PHONY: styletest unittest test
