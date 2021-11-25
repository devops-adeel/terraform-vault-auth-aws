resource "vault_namespace" "default" {
  path = format("%s-%s", "dev", "vault-aws-auth")
}

provider "vault" {
  alias     = "default"
  namespace = trimsuffix(vault_namespace.default.id, "/")
}

module "vault_aws_auth" {
  providers = {
    vault = vault.default
  }
  source = "../.."
}
