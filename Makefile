.PHONY: help build run test deploy destroy logs health-check setup

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $1, $2}'

setup: ## Initial project setup
	@chmod +x scripts/*.sh
	@./scripts/setup.sh

build: ## Build Docker image locally
	@docker build -t fastapi-app:local .

run: ## Run application locally
	@docker-compose up --build

test: ## Run tests
	@docker-compose -f docker-compose.yml -f docker-compose.test.yml up --build --abort-on-container-exit

deploy-staging: ## Deploy to staging
	@./scripts/deploy.sh staging

deploy-production: ## Deploy to production
	@./scripts/deploy.sh production

destroy-staging: ## Destroy staging infrastructure
	@./scripts/destroy.sh staging

destroy-production: ## Destroy production infrastructure
	@./scripts/destroy.sh production

logs-staging: ## View staging logs
	@./scripts/logs.sh staging

logs-production: ## View production logs
	@./scripts/logs.sh production

health-check-staging: ## Check staging application health
	@./scripts/health-check.sh "https://staging.hamza-qureshi.duckdns.org"

health-check-production: ## Check production application health
	@./scripts/health-check.sh "https://hamza-qureshi.duckdns.org"

clean: ## Clean up local Docker resources
	@docker-compose down -v
	@docker system prune -f
