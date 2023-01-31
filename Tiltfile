# -*- mode: Python -*

# ===== Sanity check =====
for env in ['KKA_APP_PATH', 'KKA_APP_REGISTRY', 'KKA_APP_DOCKERFILE', 'KKA_APP_NAME', 'KKA_APP_PORT', 'KKA_APP_K8S_DEPLOY_MANIFEST']:
    if os.getenv(env, '') == '': fail('Missing or empty {} env var. Did you run this project using Github actions?'.format(env))

# ===== Internal variables =====
APP_PATH = os.getenv('KKA_APP_PATH', '')
APP_REGISTRY = os.getenv('KKA_APP_REGISTRY', '')
APP_DOCKERFILE = os.getenv('KKA_APP_DOCKERFILE', '')
APP_NAME = os.getenv('KKA_APP_NAME', '')
APP_PORT = os.getenv('KKA_APP_PORT', '')
APP_K8S_DEPLOY_MANIFEST = os.getenv('KKA_APP_K8S_DEPLOY_MANIFEST', '')

# ===== Build container and Deploy image =====
default_registry(APP_REGISTRY)
docker_build(
  '{}/{}'.format(APP_REGISTRY, APP_NAME),
  APP_PATH,
  dockerfile='./{}'.format(APP_DOCKERFILE),
  build_args={
    'LABEL_IMAGE_SOURCE': 'https://github.com/{}'.format(os.getenv('GITHUB_REPOSITORY'))
  }
)

# ===== Deploy container to Kubernetes =====
k8s_kind('Service', api_version='serving.knative.dev/v1', image_json_path='{.spec.template.spec.containers[].image}')
k8s_yaml(local('cat {} | envsubst'.format(APP_K8S_DEPLOY_MANIFEST)))
k8s_resource(APP_NAME, port_forwards=int(APP_PORT))
