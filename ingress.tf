resource "kubernetes_ingress_v1" "test-ingress" {
  metadata {
    name = "ingress"
    namespace = kubernetes_namespace_v1.app.metadata[0].name
  }
  spec {
    ingress_class_name = "traefik"
    rule {
      host = "boutique.example.com"
      http {
         path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service_v1.nginx.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}