#!/bin/bash

# Retrieve the deploy environment metadata
ENVIRONMENTT=$(buildkite-agent meta-data get deploy-environment)
echo "Selected Environment: $ENVIRONMENTT"

# Check which environment is selected and generate the corresponding pipeline steps
if [ "$ENVIRONMENTT" == "sandbox" ]; then
  cat <<EOF
steps:
  - trigger: "qa-playwright-tests-enterprise-portal-sandbox"
    async: true
EOF
elif [ "$ENVIRONMENTT" == "int" ]; then
  cat <<EOF
steps:
  - trigger: "qa-playwright-tests-enterprise-portal-int"
    async: true
EOF
else
  echo "Unknown environment: $ENVIRONMENTT"
  exit 1
fi
