#!/bin/bash

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

