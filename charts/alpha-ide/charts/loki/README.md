# EnginePlus Loki QuickStart
When you need to install loki && promtail by metasoul-helm-charts, you can follow these steps:

## 1. Quick Helm Install 

### Access S3 with IAM Role

```shell
#Please Define Your S3 Region and Bucket
REGION="us-east-1"
# loki will create s3://YOUR_BUCKET/index/ and s3://YOUR_BUCKET/fake/
BUCKET="YOUR_BUCKET"

kubectl create namespace loki
helm install promtail ./promtail --set "loki.serviceName=loki" --namespace=loki
helm install loki ./loki --namespace=loki --set config.storage_config.aws.s3="s3://${REGION}/${BUCKET}"
```

### Access S3/OSS with Secret

Note: If you need to access oss, please set `config.storage_config.aws.s3forcepathstyle=false`

```
#Please Define Your S3/OSS Secret and Bucket
# loki will create s3://YOUR_BUCKET/index/ and s3://YOUR_BUCKET/fake/

METASOUL_ENDPOINT="YOUR_S3_ENDPOINT"
METASOUL_ACCESS_KEY_ID="YOUR_S3_ACCESS_KEY"
METASOUL_SECRET_ACCESS_KEY="YOUR_S3_ACCESS_SECRET_KEY"
REGION="YOUR_BUCKET_REGION"
BUCKET="YOUR_BUCKET"

kubectl create namespace loki
helm install loki ./loki --namespace=loki \
      --set config.storage_config.aws.bucketnames="${BUCKET}" \
      --set config.storage_config.aws.endpoint="${AWS_ENDPOINT}" \
      --set config.storage_config.aws.access_key_id="${AWS_ACCESS_KEY_ID}" \
      --set config.storage_config.aws.secret_access_key="${AWS_SECRET_ACCESS_KEY}" \
      --set config.storage_config.aws.s3forcepathstyle=true \
      --set config.storage_config.aws.region="${REGION}" \
      --set nodeSelector.nodestype=${METASOUL_SERVER_NODE}
```

## 2. Uninstall

```shell
helm uninstall promtail --namespace=loki
helm uninstall loki --namespace=loki
```
