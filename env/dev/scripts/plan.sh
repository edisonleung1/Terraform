#!/bin/bash
set -e

cd "$(dirname "$0")/.."

terraform fmt -check
terraform validate

echo "Generating plan..."
terraform plan -out=tfplan
