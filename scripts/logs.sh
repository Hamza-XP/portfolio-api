#!/bin/bash
# scripts/logs.sh - View application logs
set -e

ENVIRONMENT=${1:-staging}
LINES=${2:-100}

echo "📋 Fetching logs for $ENVIRONMENT environment..."

# Get cluster and service names from Terraform
cd terraform
terraform init -backend-config=backend-config/${ENVIRONMENT}.hcl > /dev/null

CLUSTER_NAME=$(terraform output -raw ecs_cluster_name 2>/dev/null || echo "fastapi-app-cluster")
SERVICE_NAME=$(terraform output -raw ecs_service_name 2>/dev/null || echo "fastapi-app")
LOG_GROUP=$(terraform output -raw cloudwatch_log_group 2>/dev/null || echo "/ecs/fastapi-app")

echo "🔍 Cluster: $CLUSTER_NAME"
echo "🔍 Service: $SERVICE_NAME"
echo "🔍 Log Group: $LOG_GROUP"

# Get recent logs
aws logs tail "$LOG_GROUP" --since 1h --follow
