

# # Create a Kubernetes deployment for the Node.js app
# resource "kubernetes_deployment" "node_app" {
#   metadata {
#     name = var.name
#     labels = {
#       app = var.name
#     }
#   }

#   spec {
#     replicas = 3

#     selector {
#       match_labels = {
#         app = var.name
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = var.name
#         }
#       }

#       spec {
#         container {
#           image = var.image
#           name  = var.name

#           resources {
#             limits = {
#               cpu    = "0.5"
#               memory = "512Mi"
#             }
#             requests = {
#               cpu    = "250m"
#               memory = "256Mi"
#             }
#           }
#         }
#       }
#     }
#   }
# }

# # Create a Kubernetes service to expose the deployment
# resource "kubernetes_service" "node_app" {
#   metadata {
#     name = "node-app"
#   }
#   spec {
#     selector = {
#       app = kubernetes_deployment.node_app.metadata.0.labels.app
#     }
#     port {
#       port        = 80
#       target_port = 8080
#     }
#     type = "LoadBalancer"
#   }
# }

