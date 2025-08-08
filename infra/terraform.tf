terraform {
  cloud {
    organization = "ccleanershot-org"

    workspaces {
      name    = "google-maps-with-tags"
      project = "Google Maps With Tags"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }

  required_version = ">= 1.2"
}