variable "project_id" {
  description = "GCP project ID"
}

variable "region" {
  description = "GCP region"
  default     = "asia-south1"
}

variable "machine_type" {
  description = "Mechine type"
  default     = "e2-medium"
}

variable "name" {
  default = "node-app"
}

variable "image" {
  default = "someshrao007/node_app:latest"

}

variable "clustername" {
  default = "node-app-cluster"

}
# region `asia-south1` by default
# zone `asia-south1-a` by default
