resource "kubernetes_ingress_v1" "test-ingress" {
  metadata {
    name = var.ingress_name
    namespace = var.namespace_name
  }
  spec {
    ingress_class_name = var.ingress_classname
    rule {
      host = var.ingress_hostname
      http {
         path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = var.service_name
              port {
                number = var.service_port
              }
            }
          }
        }
      }
    }
  }
}