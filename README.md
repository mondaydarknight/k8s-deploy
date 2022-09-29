# k8s-deploy
![workflow status](https://github.com/github/UPN-TW/k8s-deploy/workflows/deploy-k3d-resources.yml/badge.svg)
An action to help build Kubernetes cluster resources to GKE service.

## Usage
```yaml
jobs:
  job_id:
    steps:
      - uses: actions/checkout@v3
      - uses: UPN-TW/k8s-deploy@v1.0
        with:
          cluster: default
          context: default-context
          server: https://localhost:6443
          token: ${{ env.K8S_TOKEN }}
          user: deploy-bot
```

## Inputs
- `cluster`: The cluster name for context entry in kubeconfig.
- `context`: The name of the kubeconfig context to use.
- `server`: The server URL for context entry in kubeconfig.
- `token`: Bearer token for authentication to the API server.
- `user`: The username for context entry in kubeconfig.
