# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.4.1](https://github.com/philippe-vandermoere/helm-charts/compare/symfony-1.4.0...symfony-1.4.1) - 2021-02-11

### Fixed

- Missing Ingress annotations
- Default serviceMonitor namespace

## [1.4.0](https://github.com/philippe-vandermoere/helm-charts/compare/symfony-1.3.0...symfony-1.4.0) - 2021-02-10

### Added

- Option to enabled ingress

## [1.3.0](https://github.com/philippe-vandermoere/helm-charts/compare/symfony-1.2.0...symfony-1.3.0) - 2021-01-07

### Added

- Option to enabled volume to shared files between Nginx container and PHP-FPM container
- Option to define the command to initialize the content of the shared volume
- Option to define the command to initialize the content of the shared volume

### Fixed

- Writing the changelog of previous version

## [1.2.0](https://github.com/philippe-vandermoere/helm-charts/compare/symfony-1.1.0...symfony-1.2.0) - 2021-01-03

### Added

- Option to add labels to all deployed objects
- Option to add annotations to all deployed objects

### Fixed

- Improve documentation

## [1.1.0](https://github.com/philippe-vandermoere/helm-charts/compare/symfony-1.0.0...symfony-1.1.0) - 2021-01-02

### Added

- Option to configure a Nginx `customLivenessProbe` to override default liveness probe
- Option to configure a Nginx `customReadinessProbe` to override default readiness probe
- Option to configure a PHP-FPM `customLivenessProbe` to override default liveness probe
- Option to configure a PHP-FPM `customReadinessProbe` to override default readiness probe

## [1.0.0](https://github.com/philippe-vandermoere/helm-charts/releases/tag/symfony-1.1.0) - 2021-01-01

### Added

- Deploy a Symfony Web Application
- Option to deploy PHP workers
- Option to deploy PHP cron
- Option to configure application before starting
- Option to check the dependencies services
- Option to enabled Nginx Prometheus export
- Option to enabled PHP-FPM Prometheus export
