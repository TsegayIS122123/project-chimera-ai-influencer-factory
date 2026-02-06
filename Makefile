.PHONY: setup test spec-check docker-build docker-run lint security-check clean

# Colors for output
GREEN := \033[0;32m
YELLOW := \033[1;33m
RED := \033[0;31m
NC := \033[0m # No Color

# Variables
PROJECT_NAME := project-chimera
DOCKER_IMAGE := $(PROJECT_NAME):latest
PYTHON := python
UV := uv

setup:
@echo "$(YELLOW)Setting up Project Chimera...$(NC)"
$(UV) venv
@echo "Activate with:"
@echo "  source .venv/bin/activate  # Mac/Linux"
@echo "  .venv\\Scripts\\activate   # Windows"
$(UV) pip install .[dev]
@echo "$(GREEN)✅ Setup complete!$(NC)"

test:
@echo "$(YELLOW)Running tests...$(NC)"
$(PYTHON) -m pytest tests/ -v
@echo "$(GREEN)✅ Tests completed$(NC)"

spec-check:
@echo "$(YELLOW)Checking spec compliance...$(NC)"
@if [ ! -f "specs/_meta.md" ]; then \
echo "$(RED)❌ Missing specs/_meta.md$(NC)"; exit 1; \
fi
@if [ ! -f "specs/functional.md" ]; then \
echo "$(RED)❌ Missing specs/functional.md$(NC)"; exit 1; \
fi
@if [ ! -f "specs/technical.md" ]; then \
echo "$(RED)❌ Missing specs/technical.md$(NC)"; exit 1; \
fi
@echo "$(GREEN)✅ All spec files present$(NC)"

docker-build:
@echo "$(YELLOW)Building Docker image...$(NC)"
docker build -t $(DOCKER_IMAGE) .
@echo "$(GREEN)✅ Docker image built: $(DOCKER_IMAGE)$(NC)"

docker-run:
@echo "$(YELLOW)Running Docker container...$(NC)"
docker run --rm -it $(DOCKER_IMAGE)

lint:
@echo "$(YELLOW)Running linters...$(NC)"
$(PYTHON) -m black .
@echo "$(GREEN)✅ Linting completed$(NC)"

# FIXED: Exclude .venv directory from security check
security-check:
@echo "$(YELLOW)Running security check (excluding .venv)...$(NC)"
$(PYTHON) -m bandit -r . --exclude .venv
@echo "$(GREEN)✅ Security check completed$(NC)"

clean:
@echo "$(YELLOW)Cleaning up...$(NC)"
rm -rf .pytest_cache .mypy_cache .ruff_cache
find . -type d -name "__pycache__" -exec rm -rf {} +
find . -type f -name "*.pyc" -delete
@echo "$(GREEN)✅ Cleanup completed$(NC)"

help:
@echo "$(YELLOW)Available commands:$(NC)"
@echo "  make setup       - Install dependencies"
@echo "  make test        - Run tests"
@echo "  make spec-check  - Verify spec files exist"
@echo "  make docker-build- Build Docker image"
@echo "  make docker-run  - Run Docker container"
@echo "  make lint        - Run code formatters and linters"
@echo "  make security-check - Run security scanner (excludes .venv)"
@echo "  make clean       - Clean cache files"
@echo "  make help        - Show this help"
