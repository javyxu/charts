# ConfigMap, Secret and Role, RoleBinding, PodDefault replication for Kubernetes

```bash
kubectl create namespace kubernetes-replicator

helm install kubernetes-replicator ./ -f ./values.yaml -n kubernetes-replicator

helm ubinstall kubernetes-replicator -n kubernetes-replicator
```

See also: https://github.com/meta-soul/kubernetes-replicator.git
