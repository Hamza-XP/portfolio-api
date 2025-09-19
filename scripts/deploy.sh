#!/bin/bash
# scripts/deploy.sh - Local deployment script
set -e

ENVIRONMENT=${1:-staging}
IMAGE_TAG=${2:-latest}

echo "🚀 Deploying to $ENVIRONMENT environment..."

# Check if AWS CLI is configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "❌ AWS CLI not configured. Please run 'aws configure' first."
    exit 1
fi

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "❌ Terraform not installed. Please install Terraform first."
    exit 1
fi

# Navigate to terraform directory
cd terraform

# Initialize Terraform
echo "📋 Initializing Terraform..."
terraform init -backend-config=backend-config/${ENVIRONMENT}.hcl

# Validate configuration
echo "✅ Validating Terraform configuration..."
terraform validate

# Plan deployment
echo "📊 Planning infrastructure changes..."
terraform plan \
    -var-file=environments/${ENVIRONMENT}.tfvars \
    -var="container_image=${IMAGE_TAG}" \
    -out=${ENVIRONMENT}.tfplan

# Ask for confirmation
echo "❓ Do you want to apply these changes? (y/N)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "⚡ Applying changes..."
    terraform apply -auto-approve ${ENVIRONMENT}.tfplan
    
    echo "🎉 Deployment completed!"
    echo "🌐 Application URL: $(terraform output -raw application_url)"
else
    echo "❌ Deployment cancelled."
    exit 1
fi
