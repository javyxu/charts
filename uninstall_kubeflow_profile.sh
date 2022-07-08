kubectl get profile --no-headers | cut -d ' ' -f 1 | xargs -I {} kubectl patch profile {} -p '{"metadata":{"finalizers":null}}' --type=merge
