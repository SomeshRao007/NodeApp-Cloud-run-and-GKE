# resource "google_container_cluster" "primary" { # Create a GKE cluster
#   name               = var.clustername
#   location           = var.region
#   initial_node_count = 1

#   node_config {
#     machine_type = var.machine_type
#   }
# }