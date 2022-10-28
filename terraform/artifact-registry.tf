# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository
resource "google_artifact_registry_repository" "users-sportsapp" {
  location      = "us-central1"
  repository_id = "users-sportsapp"
  description   = "Container with User BackEnd microservice"
  format        = "DOCKER"
  project       = "sportsapp-365801"
}

resource "google_artifact_registry_repository" "front-sportsapp" {
  location      = "us-central1"
  repository_id = "front-sportsapp"
  description   = "Container with FrontEnd"
  format        = "DOCKER"
  project       = "sportsapp-365801"
}