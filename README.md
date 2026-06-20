# infra-monitoring

This repository contains the infrastructure code and configurations for monitoring my homelab environment. It includes
setup for various monitoring tools, alerting systems, and dashboards to keep track of the health and performance of my
clusters and services.

## Charts

- `kube-state-metrics/`: kube-state-metrics chart and values.
- `elastic-monitoring/`: ECK-based Elastic stack chart (Elasticsearch + Kibana + APM Server + Filebeat DaemonSet for pod logs).

## Deploy Elastic Monitoring

```bash
helm dependency update elastic-monitoring
helm upgrade --install elastic-monitoring ./elastic-monitoring -n monitoring --create-namespace
```