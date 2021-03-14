 ### ClusterIP、NordPordへのアクセス方法
 
 - /go/src/github.com/jun06t/kubernetes-sample/envoy-service-mesh を参照にサービス、デプロイメントを作成する。
 
 - 作成されたServiceの確認
 
```shell script
# exapmle
$ kubectl get svc
$ kubectl describe svc <SERVICE_NAME>
Name:                     gateway-svc
Namespace:                default
Labels:                   <none>
Annotations:              cloud.google.com/neg: {"ingress":true}
Selector:                 app=gateway
Type:                     NodePort
IP:                       10.56.8.205
Port:                     proxy  3000/TCP
TargetPort:               10000/TCP
NodePort:                 proxy  30671/TCP
Endpoints:                10.52.1.10:10000
Port:                     admin  3001/TCP
TargetPort:               10001/TCP
NodePort:                 admin  31466/TCP
Endpoints:                10.52.1.10:10001
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
```

- describeの `IP`, `Port` から `http://10.56.8.205:3000`　へのアクセスがわかる
 
- ClusterにProxyを立て、そこからアクセスする

```shell script
# example
$ kubectl run --image=centos:6 --restart=Never --rm -i testppp -- curl -s http://10.56.8.205:3000/user
{"users":[{"name":"Alice","age":20},{"name":"Bob","age":24}]}pod "testppp" deleted
```
