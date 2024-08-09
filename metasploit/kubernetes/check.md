```
use cloud/kubernetes/enum_kubernetes
```


1. Use the Metasploit k8s framework
2. Get the hostname
3. Set hostname
```
set RHOST hostname
```
4. Try obtaining an existing token:
  - `kubectl get sa`
  - `kubectl get secrets`
  - `kubectl get secret bootstrap-token-2cfprk -n kube-system -o yaml`
  - `kubectl get secret -n kube-system bootstrap-token-2cfprk -o json | jq '.data | map_values(@base64d)'`

  For EKS:
  - `aws eks get-token --cluster-name CLUSTER_NAME`

  For Kubeadm:
- `kubeadm token create --print-join-command`

5. Try to use that token:
```
set TOKEN tokenoutput
```

6. Try a few commands:
```
run
```