#!/bin/bash
# scripts/ssl-setup.sh - SSL certificate setup helper
set -e

ENVIRONMENT=${1:-staging}

echo "🔒 Setting up SSL for $ENVIRONMENT environment..."

cd terraform

# Initialize Terraform
terraform init -backend-config=backend-config/${ENVIRONMENT}.hcl

# Check if using Route53 managed DNS
if terraform show -json | grep -q "aws_route53_zone"; then
    echo "✅ Using Route53 managed DNS - SSL will be automatically configured"
    terraform apply -var-file=environments/${ENVIRONMENT}.tfvars -auto-approve
else
    echo "⚠️  Manual DNS validation required for SSL certificate"
    
    # Plan to see what will be created
    terraform plan -var-file=environments/${ENVIRONMENT}.tfvars
    
    echo "🔍 Checking for certificate validation records..."
    terraform apply -var-file=environments/${ENVIRONMENT}.tfvars -target=aws_acm_certificate.duckdns -auto-approve
    
    # Get validation records
    echo "📋 Add these DNS records to your DNS provider:"
    terraform output ssl_validation_records
    
    echo ""
    echo "❓ After adding DNS records, press Enter to continue with certificate validation..."
    read -r
    
    # Complete the deployment
    terraform apply -var-file=environments/${ENVIRONMENT}.tfvars -auto-approve
fi

echo "🎉 SSL setup completed!"
echo "🌐 Your application should be available at: $(terraform output -raw application_url)"
