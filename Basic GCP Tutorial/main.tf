terraform {
  required_version = ">= 1.1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
  cloud { 
    organization = "gavin-medlin" 
    workspaces { 
      name = "learn-terraform-gcp" 
    } 
  }   
}

provider "google" {
  project = "gm-project-01"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}