#!/usr/bin/env bash

JENKINS_CLI_URL=""

if [[ -z $JENKINS_URL ]]; then
    echo "JENKINS_URL env variable is not set"
    exit 1
else
    JENKINS_CLI_URL="$JENKINS_URL/jnlpJars/jenkins-cli.jar"
    curl "$JENKINS_CLI_URL" -o jenkins_cli.jar
fi

exec /bin/bash
