resource "kubernetes_service_v1" "nginx" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace_v1.app.metadata[0].name
  }

  spec {
    type = "ClusterIP"
    selector = {
      app = "nginx"
    }
    port {
      port = 80
      target_port = 80
      name = "http"
      protocol = "TCP"
      app_protocol = "http"
    }
  }
}