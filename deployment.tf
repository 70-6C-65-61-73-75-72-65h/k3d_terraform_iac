resource "kubernetes_deployment_v1" "nginx" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace_v1.app.metadata[0].name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:1.31"
          name = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}