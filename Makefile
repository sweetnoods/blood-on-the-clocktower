
help: ## Diplay help for Blood on the Clocktower setup script
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
build: ## Build the setup script
	docker build -t setup .

run: ## Run the setup script
	docker run -i --rm setup