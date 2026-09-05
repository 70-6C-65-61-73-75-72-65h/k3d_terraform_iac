resource "kubernetes_horizontal_pod_autoscaler_v2" "nginx" {
  metadata {
    name = var.deployment_name
    namespace = var.namespace_name
  }
  spec {
    min_replicas = 1
    max_replicas = 4
    scale_target_ref {
      kind = "Deployment"
      name = var.deployment_name
      api_version = "apps/v1"
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
    behavior {
      scale_up {
        stabilization_window_seconds = 0
        policy {
          type = "Percent"
          value = 100
          period_seconds = 15
        }
      }
      scale_down {
        stabilization_window_seconds = 300
        policy {
          type = "Percent"
          value = 33
          period_seconds = 60
        }
      }
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/horizontal_pod_autoscaler_v2