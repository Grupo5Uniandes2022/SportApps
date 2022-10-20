# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "sportsapp-365801"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "sportsapp-terraform-state"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}