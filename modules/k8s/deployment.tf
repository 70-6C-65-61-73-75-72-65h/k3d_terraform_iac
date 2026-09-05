resource "kubernetes_deployment_v1" "nginx" {
  metadata {
    name = var.deployment_name
    namespace = var.namespace_name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.deployment_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.deployment_name
        }
      }
      spec {
        container {
          image = "nginx:1.31"
          name = var.deployment_name
          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}