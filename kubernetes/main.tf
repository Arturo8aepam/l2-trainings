provider "kubectl" {
    load_config_file       = true
    #host = "https://192.168.49.2:8443"  # Use Minikube's IP and port
    #token = "YOUR_KUBECONFIG_TOKEN"  # Replace with the token from your Minikube kubeconfig maybe not needed
    #cluster_ca_certificate = file("/google/minikube/.minikube/ca.crt")  # Assuming kubeconfig is in this path
}

resource "kubectl_manifest" "test-namespace" {
    yaml_body = file("./namespace.yaml")
}

resource "kubectl_manifest" "test-deployment" {
    yaml_body = file("./deployment.yaml")
}

resource "kubectl_manifest" "test-service" {
    yaml_body = file("./service.yaml")
}