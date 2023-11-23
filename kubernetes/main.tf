provider "kubectl" {
    #host                   = "https://8080-cs-1020804010302-default.cs-us-central1-brqy.cloudshell.dev"
    load_config_file       = false 
}



resource "kubectl_manifest" "test" {
    yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
    name: hello-kubernetes-ns
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hellow-kubernetesdeploynginx
  namespace: hello-kubernetes-ns
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: hello-kubernetes
          image: nginx
          ports:
          - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: hellow-kubernetesservice
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
    - name: http
      port: 80
      targetPort: 80
YAML  
}