provider "kubectl" {
    #host                   = "https://8080-cs-1020804010302-default.cs-us-central1-brqy.cloudshell.dev"
    load_config_file       = false 
}



resource "kubectl_manifest" "test" {
    yaml_body = file("multiconfigfile.yaml")
}