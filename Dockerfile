# Use a slim Python base image for reduced attack surface
FROM python:3.11-slim

# Set environment variables to improve performance and disable .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a non-root user for security
RUN adduser --disabled-password --gecos "" appuser
WORKDIR /app

# Install OS-level dependencies (just what's needed)
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy and install dependencies separately for better caching
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the actual app code
COPY ./app /app

# Change to non-root user
USER appuser

# Expose the internal port
EXPOSE 8000

# Start the FastAPI app using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]