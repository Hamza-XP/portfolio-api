#!/bin/bash
# scripts/setup.sh - Initial setup script
set -e

echo "🔧 Setting up FastAPI deployment infrastructure..."

# Create required directories
mkdir -p {terraform/environments,terraform/backend-config,scripts,.github/workflows}

# Check prerequisites
echo "📋 Checking prerequisites..."

if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI not found. Please install AWS CLI first."
    exit 1
fi

if ! command -v terraform &> /dev/null; then
    echo "❌ Terraform not found. Please install Terraform first."
    exit 1
fi

if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Please install Docker first."
    exit 1
fi

echo "✅ All prerequisites found!"

# Configure AWS credentials if not already configured
if ! aws sts get-caller-identity > /dev/null 2>&1; then
    echo "🔐 AWS credentials not configured. Please run:"
    echo "aws configure"
    echo "Then run this script again."
    exit 1
fi

# Create S3 bucket for Terraform state
# BUCKET_NAME="terraform-state-$(date +%s)-$(whoami)"
BUCKET_NAME="portfolio-state-bucket"
echo "🪣 Creating S3 bucket for Terraform state: $BUCKET_NAME"

aws s3 mb "s3://$BUCKET_NAME" || echo "Bucket might already exist"
aws s3api put-bucket-versioning \
    --bucket "$BUCKET_NAME" \
    --versioning-configuration Status=Enabled

# Update backend configuration files
sed -i "s/portfolio-state-bucket/$BUCKET_NAME/g" terraform/backend-config/*.hcl
sed -i "s/portfolio-state-bucket/$BUCKET_NAME/g" terraform/main.tf

echo "✅ Setup completed!"
echo "📝 Next steps:"
echo "1. Update terraform/environments/*.tfvars with your specific values"
echo "2. Set up GitHub secrets in your repository"
echo "3. Push your code to trigger the CI/CD pipeline"
echo ""
echo "Required GitHub Secrets:"
echo "- AWS_ACCESS_KEY_ID"
echo "- AWS_SECRET_ACCESS_KEY" 
echo "- DUCKDNS_TOKEN (optional)"
