module "k8s" {
  source = "./modules/k8s"
  
  namespace_name = "nginx-app"
  deployment_name = "nginx"
  service_name = "nginx"
  ingress_name = "ingress"
  ingress_hostname = "boutique.example.com"
  ingress_classname = "traefik"
  service_port = 80
  container_port = 80
}

moved {
  from = kubernetes_deployment_v1.nginx
  to = module.k8s.kubernetes_deployment_v1.nginx
}
moved {
  from = kubernetes_service_v1.nginx
  to = module.k8s.kubernetes_service_v1.nginx
}
moved {
  from = kubernetes_namespace_v1.app
  to = module.k8s.kubernetes_namespace_v1.app
}
moved {
  from = kubernetes_ingress_v1.test-ingress 
  to = module.k8s.kubernetes_ingress_v1.test-ingress 
}
moved {
  from = kubernetes_horizontal_pod_autoscaler_v2.nginx 
  to = module.k8s.kubernetes_horizontal_pod_autoscaler_v2.nginx 
}