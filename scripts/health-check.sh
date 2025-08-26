#!/bin/bash
# scripts/health-check.sh - Application health check
set -e

URL=${1:-"http://localhost:8000"}
MAX_ATTEMPTS=${2:-30}
SLEEP_TIME=${3:-10}

echo "🏥 Health checking $URL..."

for i in $(seq 1 $MAX_ATTEMPTS); do
    echo "Attempt $i/$MAX_ATTEMPTS..."
    
    if curl -f "$URL/health" > /dev/null 2>&1; then
        echo "✅ Application is healthy!"
        exit 0
    else
        echo "❌ Health check failed, retrying in ${SLEEP_TIME}s..."
        sleep $SLEEP_TIME
    fi
done

echo "💀 Application failed health check after $MAX_ATTEMPTS attempts"
exit 1
