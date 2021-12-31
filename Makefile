export PROJECTNAME=$(shell basename "$(PWD)")

.SILENT: ;               # no need for @

new-project: ## Instruction to setup a new project. Run ./init-new-project.sh NEW_PROJECT_NAME
	echo "Run ./init-new-project.sh NEW_PROJECT_NAME"

setup: ## Setup Virtual Env
	poetry install

deps: ## Install/Update dependencies
	poetry lock
	poetry run pre-commit autoupdate

clean: ## Clean package
	find . -type d -name '__pycache__' | xargs rm -rf
	rm -rf build dist

pre-commit: ## Manually run all precommit hooks
	poetry run pre-commit run --all-files

tests: clean ## Run all tests
	poetry run ward

build: pre-commit tests ## Build package
	poetry build

bump: build ## Bump version and update changelog
	poetry run cz bump --changelog

bpython: ## Runs bpython
	bpython

.PHONY: help
.DEFAULT_GOAL := help

help: Makefile
	echo
	echo " Choose a command run in "$(PROJECTNAME)":"
	echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	echo
