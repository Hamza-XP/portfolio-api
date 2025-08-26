#!/bin/bash
# scripts/destroy.sh - Destroy infrastructure script
set -e

ENVIRONMENT=${1:-staging}

echo "🗑️  Destroying $ENVIRONMENT environment..."
echo "⚠️  This will permanently delete all resources!"
echo "❓ Are you sure? Type 'yes' to confirm:"
read -r response

if [[ "$response" == "yes" ]]; then
    cd terraform
    terraform init -backend-config=backend-config/${ENVIRONMENT}.hcl
    terraform destroy -var-file=environments/${ENVIRONMENT}.tfvars -auto-approve
    echo "✅ Infrastructure destroyed successfully!"
else
    echo "❌ Destruction cancelled."
    exit 1
fi
