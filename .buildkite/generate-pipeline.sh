#!/bin/bash

ENVIRONMENT=$(buildkite-agent meta-data get deploy-environment)
echo "$ENVIRONMENT"

if [[ "$ENVIRONMENT" == "sandbox" ]]; then
  buildkite-agent pipeline upload <<EOF
  steps:
    - trigger: "qa-playwright-tests-enterprise-portal-sandbox"
      async: true
EOF
elif [[ "$ENVIRONMENT" == "int" ]]; then
  buildkite-agent pipeline upload <<EOF
  steps:
    - trigger: "qa-playwright-tests-enterprise-portal-int"
      async: true
EOF
fi

