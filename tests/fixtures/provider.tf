terraform {
  backend "remote" {
    organization = "Sophos-CyberSecurity"
    workspaces {
      name = "terraform-vault-aws-auth"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn = "arn:aws:iam::976356915001:role/vault-aws-auth-role"
  }
}

provider "vault" {
  address = "https://use2.vault.sst.sophosapps.com"
}
