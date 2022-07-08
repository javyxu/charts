# alpha-ide-chart
提供Helm方式，快速部署AlphaIDE系统套件。

# Quik-Start
## 可选
  安装istio
  
  ```bash
  helm install istio ./charts/istio
  ```
  
  安装cert-manager

  ```bash
  helm install cert-manager ./charts/cert-manager/ -n cert-manager --namespace cert-manager --create-namespace
  ```
## 安装AlphaIDE


```bash
helm upgrade --install alpha-ide ./ 
```
该命令将自动部署alpha-ide, 定制kubeflow, prometheus-stack等组件。
访问：
```
kubectl get ingress -n istio-system
NAME                     CLASS    HOSTS                    ADDRESS         PORTS   AGE
alphaide-istio-ingress   <none>   dev.dmetasoul-test.com   172.20.123.50   80      82s
```
添加hosts `172.20.123.50 dev.dmetasoul-test.com`，即可通过账号user@example.com，密码12341234进行登录，体验AlphaIDE。

# 卸载AlphaIDE

```
helm uninstall alpha-ide
bash ./uninstall_kubeflow_profile.sh
```