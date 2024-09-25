#!/bin/bash

# Retrieve the deploy environment metadata
ENVIRONMENT=$(buildkite-agent meta-data get deploy-environment)
echo "Selected Environment: $ENVIRONMENT"

# Check which environment is selected and generate the corresponding pipeline steps
if [ "$ENVIRONMENT" == "sandbox" ]; then
  cat <<EOF
steps:
  - trigger: "qa-playwright-tests-enterprise-portal-sandbox"
    async: true
EOF
elif [ "$ENVIRONMENT" == "int" ]; then
  cat <<EOF
steps:
  - trigger: "qa-playwright-tests-enterprise-portal-int"
    async: true
EOF
else
  echo "Unknown environment: $ENVIRONMENT"
  exit 1
fi
