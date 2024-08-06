# output "load_balancer_ip" {
#   value = kubernetes_service.node_app.status
# }



output "service_url" {
  value = google_cloud_run_service.node_app.status.0.url
}
