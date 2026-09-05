resource "kubernetes_service_v1" "nginx" {
  metadata {
    name = var.service_name
    namespace = var.namespace_name
  }

  spec {
    type = "ClusterIP"
    selector = {
      app = var.service_name
    }
    port {
      port = var.service_port
      target_port = var.container_port
      name = "http"
      protocol = "TCP"
      app_protocol = "http"
    }
  }
}