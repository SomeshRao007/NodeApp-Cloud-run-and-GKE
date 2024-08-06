
resource "google_cloud_run_service" "node_app" {
  name     = "node-app"
  location = var.region

  template {
    spec {
      containers {
        image = "someshrao007/node_app:latest"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.node_app.location
  project  = google_cloud_run_service.node_app.project
  service  = google_cloud_run_service.node_app.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
