# EnginePlus kube-prometheus-stack QuickStart

Before we install the prometheues stack , you should know we add our custom spark-mointor-dashboard in `metasoul-helm-charts/kube-prometheus-stack/charts/grafana/dashboards/spark-monitor-dashboard.json `, if you have installed prometheues stack, your can import the json called `spark-monitor-dashboard.json` to your grafana directly.

When you need to install spark history server by metasoul-helm-charts, you can follow these steps:

## 1. prometheus-stack Helm Install

```bash
kubectl create namespace monitoring
helm install prometheus-stack ./kube-prometheus-stack -n monitoring \
             --set grafana.enabled=true \
             --set grafana.adminPassword=${METASOUL_PASSWORD} \
             --set grafana.ingress.enabled=${METASOUL_INGRESS_ENABLED} \
             --set grafana.ingress.hosts={grafana.${METASOUL_INGRESS_HOST}}

```

CN Cloud:
```bash
helm upgrade prometheus-stack ./kube-prometheus-stack -n monitoring --install \
             --set grafana.enabled=true \
             --set grafana.adminPassword=${METASOUL_PASSWORD} \
             --set grafana.ingress.enabled=${METASOUL_INGRESS_ENABLED} \
             --set grafana.ingress.hosts={grafana.${METASOUL_INGRESS_HOST}} \
             --set grafana.persistence.enabled=true \
             --set grafana.nodeSelector.nodestype=spark-applications-driver-nodes \
             --set prometheus.prometheusSpec.nodeSelector.nodestype=spark-applications-driver-nodes \
             --set kube-state-metrics.image.repository=swr.cn-southwest-2.myhuaweicloud.com/dmetasoul-public/kube-state-metrics \
             --set kube-state-metrics.image.tag=dmetasoul-v1.0.0 \
             --set prometheus-node-exporter.image.repository=swr.cn-southwest-2.myhuaweicloud.com/dmetasoul-public/node-exporter \
             --set prometheus-node-exporter.image.tag=dmetasoul-v1.0.0
```
## 2. Uninstall

```shell
helm uninstall prometheus-stack -n monitoring
kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
```
