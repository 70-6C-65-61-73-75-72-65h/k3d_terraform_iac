resource "kubernetes_horizontal_pod_autoscaler_v2" "nginx" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace_v1.app.metadata[0].name
  }
  spec {
    min_replicas = 1
    max_replicas = 4
    scale_target_ref {
      kind = "Deployment"
      name = kubernetes_deployment_v1.nginx.metadata[0].name
    }
    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type = "Utilization"
          average_utilization = 70
        }
      }
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/horizontal_pod_autoscaler_v2