terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

    ovh = {
      source  = "ovh/ovh"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
