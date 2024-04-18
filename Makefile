## ---------- UTILS
.PHONY: help
help: ## Show this menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: clean
clean: ## Clean all temp files
	@rm -rf main



## ---------- SETUP
.PHONY: install
install: ## Install the requirements
	@go install github.com/google/wire/cmd/wire@latest



## ---------- MAIN
.PHONY: gen
gen: ## Run wire gen
	@wire

.PHONY: run
run: ## Run the code
	@go run main.go wire_gen.go
