terraform {
  backend "remote" {
    organization = "org"
    workspaces {
      name = "terraform-vault-aws-auth"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn = "arn"
  }
}

provider "vault" {}
