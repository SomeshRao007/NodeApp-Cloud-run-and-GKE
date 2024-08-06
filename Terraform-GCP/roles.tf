# Define a custom role with the required permissions
resource "google_project_iam_custom_role" "node_app_role" {
  role_id     = "nodeAppRole"
  title       = "Node App Role"
  description = "Custom role for managing Node.js application on GKE"
  permissions = [
    "container.clusters.get",
    "container.clusters.list",
    "container.pods.get",
    "container.pods.list",
    "container.services.get",
    "container.services.list",
  ]
}

# Get the service account used by the GKE nodes
data "google_compute_default_service_account" "default" {
  project = var.project_id
}

# Bind the custom role to the GKE node service account
resource "google_project_iam_binding" "node_app_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.node_app_role.name

  members = [
    "serviceAccount:${data.google_compute_default_service_account.default.email}",
  ]
}
