# Symfony

Chart for PHP Symfony application

## Requirements

- helm: >= 3.0.0
- kubernetes: >=1.18.0

## Usage

### Installing the Chart

To install the chart with the release name my-release:

```bash
helm repo add philippe-vandermoere https://philippe-vandermoere.github.io/helm-charts/
helm install my-release philippe-vandermoere/symfony
```

These commands deploy symfony application on the Kubernetes cluster in the default configuration.

> **Tip**: List all releases using `helm list`

### Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following tables lists the configurable parameters of the symfony chart, and their default values per section / component:

### Global

| Key | Description | Type | Default |
|-----|------|---------|-------------|
| version | Version of application | string | `""` |
| image.repository | Global PHP image repository | string | `"php"` |
| image.tag | Global PHP image tag | string | `"8.0-fpm-alpine"` |
| image.pullPolicy | Global PHP image pull policy | string | `"IfNotPresent"` |
| env | Global environment variables | object | `{}` |
| commonLabels | Labels to add to all deployed objects | string | `nil` |
| commonAnnotations | Annotations to add to all deployed objects | string | `nil` |

### Web

| Key | Description | Type | Default |
|-----|------|---------|-------------|
| web.enabled | Enable web deployment | bool | `true` |
| web.replica | Number of Symfony web replicas to deploy | int | `3` |
| web.ingress.enabled | Enable ingress controller resource | bool | `false` |
| web.ingress.certManager | Add annotations for cert-manager | bool | `false` |
| web.ingress.hostname | Default host for the ingress resource | string | `"symfony.local"` |
| web.ingress.path | Default path for the ingress resource | string | `"/"` |
| web.ingress.pathType | Default pathType for the ingress resource | string | `"ImplementationSpecific"` |
| web.ingress.annotations | Annotations to add to ingress object | object | `{}` |
| web.ingress.extraHosts[].name | Additional host name to be covered | string | `nil` |
| web.ingress.extraHosts[].path | Additional host path to be covered | string | `"/"` |
| web.ingress.extraHosts[].pathType | Additional host pathType to be covered | string | `"ImplementationSpecific"` |
| web.service.type | Kubernetes Service type | string | `"ClusterIP"` |
| web.service.port | Kubernetes Service port | int | `80` |
| web.service.clusterIP | Kubernetes Service IP | string | `""` |
| web.nginx.port | Nginx container port | int | `80` |
| web.nginx.image.repository | Nginx image repository | string | `"nginx"` |
| web.nginx.image.tag | Nginx image tag | string | `"stable-alpine"` |
| web.nginx.image.pullPolicy | Nginx image pull policy | string | `"IfNotPresent"` |
| web.nginx.config.main | Nginx principal configuration | string | Check `values.yaml` file |
| web.nginx.config.serverBlock | Nginx server configuration | string | Check `values.yaml` file |
| web.nginx.config.documentRoot | Nginx configuration | string | `"/var/www/html/public"` |
| web.nginx.config.sharedPublicFiles.enabled | Enabled Nginx shared public volume | bool | `false` |
| web.nginx.config.sharedPublicFiles.initCommand | Command to populate Nginx shared public volume | string | Check `values.yaml` file |
| web.nginx.livenessProbe | Nginx liveness probe |  | Check `values.yaml` file |
| web.nginx.customLivenessProbe | Override default Nginx liveness probe | object | `nil` |
| web.nginx.readinessProbe | Nginx readiness probe |  | Check `values.yaml` file |
| web.nginx.customReadinessProbe | Override default Nginx readiness probe | object | `nil` |
| web.nginx.resources.requests | The requested resources for the NGINX container | object | `{}` |
| web.nginx.resources.limits | The resources limits for the NGINX container | object | `{}` |
| web.phpfpm.image.repository | PHP-FPM image repository (override global PHP image) | string | |
| web.phpfpm.image.tag | PHP-FPM image tag (override global PHP image) | string | |
| web.phpfpm.image.pullPolicy | PHP-FPM image pull policy (override global PHP image) | string | |
| web.phpfpm.env | PHP-FPM environment variables (override global environment variables) | object | `{}` |
| web.phpfpm.livenessProbe.enabled | PHP-FPM liveness probe |  | Check `values.yaml` file |
| web.phpfpm.customLivenessProbe | Override default PHP-FPM liveness probe | object | `nil` |
| web.phpfpm.readinessProbe | PHP-FPM readiness probe | | Check `values.yaml` file |
| web.phpfpm.customReadinessProbe | Override default PHP-FPM readiness probe | object | `nil` |
| web.phpfpm.resources.requests | The requested resources for the PHP-FPM container | object | `{}` |
| web.phpfpm.resources.limits | The resources limits for the PHP-FPM container | object | `{}` |

### Workers

| Key | Description | Type | Default |
|-----|------|---------|-------------|
| workers[].name | Worker name  | string |  |
| workers[].enabled | Enable worker deployment | bool | `true` |
| workers[].replica | Number of worker replicas to deploy | int |  |
| workers[].command | Command of worker | string |  |
| workers[].image.repository | Worker image repository (override global PHP image) | string | `"image.repository"` |
| workers[].image.tag | Worker image tag (override global PHP image)  | string | `"image.tag"` |
| workers[].image.pullPolicy | Worker image pull policy (override global PHP image) | string | `"image.pullPolicy"` |
| workers[].env | Worker environment variables (override global environment variables) | object | `{}` |
| workers[].resources.requests | The requested resources for the worker container  | object | `{}` |
| workers[].resources.limits | The resources limits for the worker container | object | `{}` |

### Crons

| Key | Description | Type | Default |
|-----|------|---------|-------------|
| crons[].name | Cron name  | string |  |
| crons[].enabled | Enable cron job | bool | `true` |
| crons[].schedule | Cron schedule  | string |  |
| crons[].command | Command of cron | string |  |
| crons[].image.repository | Cron image repository (override global PHP image) | string | `"image.repository"` |
| crons[].image.tag | Cron image tag (override global PHP image) | string | `"image.tag"` |
| crons[].image.pullPolicy | Cron image pull policy (override global PHP image) | string | `"image.pullPolicy"` |
| crons[].env | Cron environment variables (override global environment variables) | object | `{}` |
| crons[].resources.requests | The requested resources for the cron container | object | `{}` |
| crons[].resources.limits | The resources limits for the cron container | object | `{}` |
| crons[].restartPolicy | Cron restart policy  | string | `"OnFailure"` |
| crons[].concurrencyPolicy | Cron concurrency policy | string | `"Forbid"` |

### Migrations

| Key | Description | Type | Default |
|-----|------|---------|-------------|
| migrations[].name | Migration name | string |  |
| migrations[].enabled | Enable migration job | bool | `true` |
| migrations[].command | Command of migration | string |  |
| migrations[].image.repository | Migration image repository (override global PHP image) | string | `"image.repository"` |
| migrations[].image.tag | Migration image tag (override global PHP image) | string | `"image.tag"` |
| migrations[].image.pullPolicy | Migration image pull policy (override global PHP image) | string | `"image.pullPolicy"` |
| migrations[].env | Migration environment variables (override global environment variables) | object | `{}` |
| migrations[].resources.requests | The requested resources for the migration container | object | `{}` |
| migrations[].resources.limits | The resources limits for the migration container | object | `{}` |
| migrations[].timeout | Migration run timeout | object | `60` |
| migrations[].restartPolicy | Migration restart policy | string | `"Never"` |
| migrations[].backoffLimit | Number of migration retry | int | `0` |

### Dependencies

| Key | Description | Type | Default |
|-----|------|---------|-------------|
| dependencies.timeout | Dependencies timeout | int | `20` |
| dependencies.image.repository | Dependencies image repository | string | `"busybox"` |
| dependencies.image.tag | Dependencies image tag | string | `"1.32.0"` |
| dependencies.image.pullPolicy | Dependencies image pull policy | string | `"IfNotPresent"` |
| dependencies.services[].name | Service name | string |  |
| dependencies.services[].host | Service host | string |  |
| dependencies.services[].port | Service port | int |  |

### Metrics

| Key | Description | Type | Default |
|-----|------|---------|-------------|
| metrics.enabled | Enable Prometheus exporter | bool | `false` |
| metrics.serviceMonitor.enabled | Enable Prometheus service monitor | bool | `false` |
| metrics.serviceMonitor.namespace | Prometheus namespace | string | `nil` |
| metrics.nginx.image.repository | Nginx Prometheus exporter image repository | string | `"nginx/nginx-prometheus-exporter"` |
| metrics.nginx.image.tag | Nginx Prometheus exporter image tag | string | `"0.8.0"` |
| metrics.nginx.image.pullPolicy | Nginx Prometheus exporter image pull policy | string | `"IfNotPresent"` |
| metrics.nginx.statusUrl | Nginx status Url | string | `"http://127.0.0.1:80/status"` |
| metrics.nginx.path | Nginx Prometheus exporter path | string | `"/metrics"` |
| metrics.nginx.port | Nginx Prometheus exporter port | int | `9113` |
| metrics.nginx.resources.requests | The requested resources for the Nginx Prometheus exporter container | object | `{}` |
| metrics.nginx.resources.limits | The resources limits for the Nginx Prometheus exporter container | object | `{}` |
| metrics.phpfpm.image.repository | PHP-FPM Prometheus exporter image repository | string | `"bakins/php-fpm-exporter"` |
| metrics.phpfpm.image.tag | PHP-FPM Prometheus exporter image tag | string | `"v0.6.1"` |
| metrics.phpfpm.image.pullPolicy | PHP-FPM Prometheus exporter image pull policy | string | `"IfNotPresent"` |
| metrics.phpfpm.statusUrl | PHP-FPM status Url | string | `"tcp://127.0.0.1:9000/status"` |
| metrics.phpfpm.path | PHP-FPM Prometheus exporter path | string | `"/metrics"` |
| metrics.phpfpm.port | PHP-FPM Prometheus exporter port | int | `9114` |
| metrics.phpfpm.resources.requests | The requested resources for the PHP-FPM Prometheus exporter container | object | `{}` |
| metrics.phpfpm.resources.limits | The resources limits for the PHP-FPM Prometheus exporter container | object | `{}` |

## Configuration and installation details

### Adding environment variables

In case you want to add environment variables, you can use the `env` property.

You can define globally:

```yaml
env:
  TIMEZONE: utc
  TRUSTED_PROXIES: 10.0.0.0/8
  DATABASE_URL: mysql://{user}:{password}@{host}:{port}/{db}
  MESSENGER_TRANSPORT_DSN: amqp://{user}:{password}@{host}:{port}/{vhost url encoding}/messages
  REDIS_DSN: redis://{password}@{host}:{port}
```

You can override locally (in this example im using a different user and password for running database migration):

```yaml
env:
  DATABASE_URL: mysql://{user}:{password}@{host}:{port}/{db}
migrations:
  - name: doctrine
    command: bin/console doctrine:migrations:migrate --allow-no-migration --no-interaction
    env:
      DATABASE_URL: mysql://{root_user}:{root_password}@{host}:{port}/{db}
```

### Adding Migration

In case you want to configure your application dependency before running, you can use the `migrations` property:

```yaml
migrations:
  - name: doctrine
    command: bin/console doctrine:migrations:migrate --allow-no-migration --no-interaction
    timeout: 60
  - name: messenger
    command: bin/console messenger:setup-transports --no-interaction
    timeout: 20
```

### Adding Worker

In case you want to run a worker for your application, you can use the `workers` property:

```yaml
workers:
  - name: messenger
    replica: 3
    command: bin/console messenger:consume --memory-limit=128M --time-limit=3600
```

### Adding Cron

In case you want to run a cron for your application, you can use the `crons` property:

```yaml
crons:
  - name: cacheprune
    schedule: "* * * * *"
    command: bin/console cache:pool:prune
```

### Waiting for dependency

In case you want to check if the dependencies services are ready, you can use the `dependencies.services` property:

```yaml
dependencies:
  services:
    - name: mysql
      host: mysql
      port: 3306
    - name: rabbitmq
      host: rabbitmq
      port: 5672
```
