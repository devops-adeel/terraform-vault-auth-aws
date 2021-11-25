terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
    vault = {
      version = "2.23.0"
      source  = "hashicorp/vault"
    }
  }
}
