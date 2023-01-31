#!/usr/bin/env bash

###############################################################################
# Check if argument $1 matches argument $2
###############################################################################
# Arguments:
# $1: name of the argument ( required )
# $2: argument to check ( required )
# $3: expected value ( required )
###############################################################################
function kka_assert_argument
{
  if [ "$2" != "$3" ]; then
    echo "kka_assert_argument: '$1' value '$2' does not match. Expected: '$3'"
    exit 1
  else
    echo "kka_assert_argument: '$1' value '$2' does match."
  fi
}
export -f kka_assert_argument

###############################################################################
# Autodetect the Application Name
###############################################################################
function kka_autodetect_app_name
{
  if [ -z "$KKA_APP_NAME" ]; then
    echo "KKA_APP_NAME is empty. Starting autodetection..."
    export KKA_APP_NAME=${GITHUB_REPOSITORY##*\/}
    echo "KKA_APP_NAME=${KKA_APP_NAME}"
  fi
}
export -f kka_autodetect_app_name

###############################################################################
# Autodetect the Docker Registry
###############################################################################
function kka_autodetect_docker_registry
{
  if [ -z "$KKA_APP_REGISTRY" ]; then
    echo "KKA_APP_REGISTRY is empty. Starting autodetection..."
    export KKA_APP_REGISTRY="ghcr.io/${GITHUB_REPOSITORY_OWNER}"
    echo "KKA_APP_REGISTRY=${KKA_APP_REGISTRY}"
  fi
}
export -f kka_autodetect_docker_registry

###############################################################################
# Autodetect the Dockerfile path to use
###############################################################################
function kka_autodetect_dockerfile_path
{
  if [ -z "$KKA_APP_DOCKERFILE" ]; then
    echo "KKA_APP_DOCKERFILE is empty. Starting autodetection..."

    if [ -f "package.json" ]; then
      PROJECT_TYPE="node"
    fi

    export KKA_APP_DOCKERFILE="dockerfiles/Dockerfile.${PROJECT_TYPE}"
    echo "KKA_APP_DOCKERFILE=${KKA_APP_DOCKERFILE}"
  fi
}
export -f kka_autodetect_dockerfile_path
