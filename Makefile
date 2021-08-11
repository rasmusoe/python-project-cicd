PY = python
VENV = .venv/venv
BIN = $(VENV)/bin
REQUIREMENTS = requirements

##########################################
# Environment definitions
##########################################
$(VENV): $(REQUIREMENTS)/dev.txt setup.py
	$(PY) -m venv $(VENV)
	touch $(VENV)

##########################################
# Dev setup
##########################################
.PHONY: env-init
env-init: $(VENV)
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install -q build==0.5.1
	$(BIN)/pip install pip-tools==6.2.0
	$(BIN)/pip install tox==3.23.1

.PHONY: env-install
env-install: $(VENV)
	$(BIN)/pip install -r $(REQUIREMENTS)/dev.txt
	$(BIN)/pip install -e .

.PHONY: env-clean
env-clean:
	rm -rf $(VENV)
	find . -type f -name *.pyc -delete
	find . -type d -name __pycache__ -delete
	rm -rf build/
	rm -rf dist/
	rm -rf src/*.egg*
	rm -rf docs/build/
	rm -rf .tox/
	rm -f .coverage.*

.PHONY: env-setup
env-setup: | env-clean env-init env-install

##########################################
# Dev test profiles
##########################################
.PHONY: dev-style
dev-style: $(VENV)
	$(BIN)/tox -e style

.PHONY: dev-typing
dev-typing: $(VENV)
	$(BIN)/tox -e typing

.PHONY: dev-tests
dev-tests: $(VENV)
	$(BIN)/tox

.PHONY: dev-coverage
dev-coverage: $(VENV)
	$(BIN)/tox -e coverage

.PHONY: dev-docs
dev-docs: $(VENV)
	$(BIN)/tox -e docs

.PHONY: dev-black
dev-black: $(VENV)
	$(BIN)/tox -e black

.PHONY: dev-all
dev-all: | dev-tests dev-coverage dev-style dev-typing dev-docs

##########################################
# Dev build
##########################################

.PHONY: build-dist
build-dist: $(VENV)
	$(BIN)/python -m build

.PHONY: build-deps
update-deps: $(VENV)
	$(BIN)/pip-compile
	$(BIN)/pip-compile --output-file $(REQUIREMENTS)/dev.txt $(REQUIREMENTS)/dev.in

.PHONY: build-test-deps
update-test-deps: $(VENV)
	$(BIN)/pip-compile --output-file $(REQUIREMENTS)/docs.txt $(REQUIREMENTS)/docs.in
	$(BIN)/pip-compile --output-file $(REQUIREMENTS)/style.txt $(REQUIREMENTS)/style.in
	$(BIN)/pip-compile --output-file $(REQUIREMENTS)/typing.txt $(REQUIREMENTS)/typing.in
	$(BIN)/pip-compile --output-file $(REQUIREMENTS)/tests.txt $(REQUIREMENTS)/tests.in
	
##########################################
# All
##########################################

all: | env-setup dev-all build-dist
