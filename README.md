# k8s-kurated-addons-action

A Github action for [k8s-kurated-addons](https://github.com/nearform/k8s-kurated-addons) that will allow you to build and deploy your code to the Kubernetes cluster.

## How to use

In order to use this action, all you need it add this snippet to your own workflows:

```yaml
- uses: nearform-actions/k8s-kurated-addons-action@main
  with:
    app-name: my-app-name
    app-port: 8080
    docker-registry: ghcr.io
    dockerfile-path: ./Dockerfile 
    kubernetes-manifest: ./knative.yaml
```

## Inputs

| input                 | required | default                        | description |
|-----------------------|----------|--------------------------------|-------------|
| `app-name`            | no       | `''`                           | The name of your app. This will be used both as the image name as well as the Knative service name for the deployment. |
| `app-port`            | no       | `8080`                         | The port of your app. Usually this is the HTTP/HTTPS port your own app will be listening on. |
| `docker-registry`     | no       | `ghcr.io`                      | Docker registry to use to host the built container. |
| `dockerfile-path`     | no       | `''`                           | The Dockerfile to use. If not set, the action will attempt to autodetect the project type and use accordingly a well-known one for your project type. |
| `kubernetes-manifest` | no       | `./manifests/knative-app.yaml` | The Kubernetes manifest to use. If not set, the action will use a pre-made Knative manifest. |


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
