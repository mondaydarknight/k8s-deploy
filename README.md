# k8s-setup
![workflow status](https://github.com/github/UPN-TW/k8s-setup/workflows/deploy-k3d.yml/badge.svg)
An action to help build Kubernetes cluster resources to GKE service.

## Usage
```yaml
jobs:
  job_id:
    steps:
      - uses: actions/checkout@v3
      - uses: UPN-TW/k8s-setup@v1.0
        with:
          cluster: ${{ secrets.K8S_CLUSTER }}
          context: ${{ secrets.K8S_CONTEXT }}
          server: ${{ secrets.K8S_SERVER }}
          token: ${{ secrets.K8S_TOKEN }}
          user: ${{ secrets.K8S_USER }}
```

## Inputs
- `cluster`: The cluster name for context entry in kubeconfig.
- `context`: The name of the kubeconfig context to use.
- `server`: The server URL for context entry in kubeconfig.
- `template_path`: (Optional) The directory that contains configuration files to apply.
- `token`: Bearer token for authentication to the API server.
- `user`: The username for context entry in kubeconfig.
- `validate`: (Optional) Determine whether the cluster validate the input schema.<br>Default: false
