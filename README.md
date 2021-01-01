# Helm Charts

## Requirements

- [helm](https://helm.sh/docs/intro/install) >= 3.0.0
- [kubernetes](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/) >= 1.18.0

## Add Repo

```bash
helm repo add philippe-vandermoere https://philippe-vandermoere.github.io/helm-charts/
```

## List Chart Repo

```bash
helm repo add philippe-vandermoere https://philippe-vandermoere.github.io/helm-charts/
helm search repo philippe-vandermoere
```

## Installing the Chart

```bash
helm repo add philippe-vandermoere https://philippe-vandermoere.github.io/helm-charts/
helm install my-release philippe-vandermoere/<chart>
```

## Upgrade the Chart

```bash
helm upgrade my-release philippe-vandermoere/<chart>
```

## Uninstalling the Chart

```bash
helm uninstall my-release
```
