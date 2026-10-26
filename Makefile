PYTHON:=python3
VENV:=.venv
VENV_PYTHON:=$(VENV)/bin/python

.PHONY: setup test lint lint-fix clean up

setup:
	$(PYTHON) -m venv $(VENV)
	$(VENV_PYTHON) -m pip install --upgrade pip
	$(VENV_PYTHON) -m pip install -r requirements.txt

test:
	$(VENV_PYTHON) -m pytest -v tests

up:
	docker compose up -d

lint:
	$(VENV_PYTHON) -m ruff check .

lint-fix:
	$(VENV_PYTHON) -m ruff check --fix .

clean:
	find . \( -path "./$(VENV)" -o -path "./.git" -o -path "./data" \) -prune -o \
		-type d \( -name __pycache__ -o -name .pytest_cache -o -name .ruff_cache \) \
		-prune -exec rm -rf {} +
