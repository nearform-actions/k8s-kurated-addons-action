#!/usr/bin/env bash

set -e

source src/utils/helpers.sh $@

pushd $KKA_APP_PATH

### Application Name

kka_autodetect_app_name
kka_assert_argument "KKA_APP_NAME" "$KKA_APP_NAME" "k8s-kurated-addons-action"

### Docker Registry

kka_autodetect_docker_registry
kka_assert_argument "KKA_APP_REGISTRY" "$KKA_APP_REGISTRY" "ghcr.io/nearform-actions"

### Dockerfile path

kka_autodetect_dockerfile_path
kka_assert_argument "KKA_APP_DOCKERFILE" "$KKA_APP_DOCKERFILE" "dockerfiles/Dockerfile.node"

### End of tests

popd
