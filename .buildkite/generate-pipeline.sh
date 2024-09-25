#!/bin/bash

# Determine the value of MY_BOOLEAN_VAR
if [ "$ENVIRONMENT" = "sandbox" ]; then
  cat <<EOF
steps:
  - label: "Dynamic Sleep Test"
    command: |
      trigger: "qa-playwright-tests-enterprise-portal-sandbox"
EOF
else
  cat <<EOF
steps:
  - label: "Dynamic Sleep Test (No Retry)"
    command: |
      trigger: "qa-playwright-tests-enterprise-portal-int"
EOF
fi
