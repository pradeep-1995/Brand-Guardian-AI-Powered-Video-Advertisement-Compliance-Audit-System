FROM python:3.12-slim

WORKDIR /app

# Install uv and dependencies using lock file
COPY pyproject.toml uv.lock ./
RUN uv pip install --system -r pyproject.toml

# Copy full source code
COPY . .

EXPOSE 8000
CMD ["uv", "run", "uvicorn", "backend.app.main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]