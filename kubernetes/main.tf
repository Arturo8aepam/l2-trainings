provider "kubectl" {
  load_config_file       = false
}

resource "kubectl_manifest" "test" {
    yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
name: hello-kubernetes-ns
labels:
    name: hello-kubernetes-ns
---
apiVersion: apps/v1
kind: Deployment
metadata:
name: hellow-kubernetes
namespace: hello-kubernetes-ns
spec:
replicas: 3  
template:
metadata:
    labels:
    app: my-app
spec:
    containers:
    - name: nginx
    image: paulbouwer/hello-kubernetes
    ports:
    - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
name: hellow-kubernetes–svc
namespace: hello-kubernetes-ns
spec:
type: NodePort
selector:
    app: MyApp
ports:
- protocol: TCP
    port: 80
    targetPort: 80
YAML  
}