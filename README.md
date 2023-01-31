# k8s-kurated-addons-action

A Github action for [k8s-kurated-addons](https://github.com/nearform/k8s-kurated-addons) that will allow you to build and deploy your code to the Kubernetes cluster.

## How to use

In order to use this action, all you need it add this snippet to your own workflows:

```yaml
- uses: nearform-actions/k8s-kurated-addons-action@main
  with:
    app-name: my-app-name # OPTIONAL: Your application name. If not set, it will use your repository name
    app-port: 8080 # OPTIONAL: Your application port. If not set, 8080 will be used
    docker-registry: ghcr.io # OPTIONAL: The docker registry to use. If not set, the action will try to use ghcr.io
    dockerfile-path: ./Dockerfile # OPTIONAL: The Dockerfile to use. If not set, the action will attempt to autodetect the project type and use accordingly a well-known one for your project type
    kubernetes-manifest: ./knative.yaml # OPTIONAL: The Kubernetes manifest to use. If not set, the action will use a pre-made Knative manifest
```

For a more in-depth documentation around the current available inputs, see the [action manifest inputs section](action.yaml#L3).

## How to test locally

You can test this action by simply installing [act](https://github.com/nektos/act), then clone this repository and:

```bash
$ cd path/to/k8s-kurated-addons-action
# Run the action without unit tests
$ make local
# Run the action with unit tests
$ make local UNIT_TEST=true
```

We suggest using the `Medium` image as it is closest to the ones provided by the Github Runners themselves.
