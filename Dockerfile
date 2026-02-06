FROM python:3.11-slim

WORKDIR /app

# Copy dependency files first (for caching)
COPY pyproject.toml ./

# Install minimal dependencies
RUN pip install --no-cache-dir pytest pydantic

# Copy the rest of the code
COPY . .

# Run tests (should fail - that's expected for TDD)
CMD ["python", "-m", "pytest", "tests/", "-v"]
