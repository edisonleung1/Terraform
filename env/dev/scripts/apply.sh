#!/bin/bash
set -e

cd "$(dirname "$0")/.."

if [ ! -f tfplan ]; then
  echo "No plan file found. Run plan.sh first."
  exit 1
fi

echo "Applying saved plan..."
terraform apply tfplan
