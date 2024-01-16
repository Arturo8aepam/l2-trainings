provider "kubectl" {
    load_config_file       = false
    host = "https://192.168.49.2:8443"  # Use Minikube's IP and port
    #token = "YOUR_KUBECONFIG_TOKEN"  # Replace with the token from your Minikube kubeconfig maybe not needed
    cluster_ca_certificate = base64decode(file("/home/user/.kube/config"))  # Assuming kubeconfig is in this path
}

resource "kubectl_manifest" "test" {
    yaml_body = file("./multiconfigfile.yaml")
}