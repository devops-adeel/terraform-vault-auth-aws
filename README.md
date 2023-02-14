<!-- BEGIN_TF_DOCS -->


```hcl
module "vault_aws_auth" {
  source = "github.com/devops-adeel/terraform-vault-auth-aws.git"
}
```
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.12.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.54.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 3.12.0 |

## Inputs

No inputs.

## Outputs

No outputs.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.default](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/iam_access_key) | resource |
| [aws_iam_user.default](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.default](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/resources/iam_user_policy) | resource |
| [vault_auth_backend.default](https://registry.terraform.io/providers/hashicorp/vault/3.12.0/docs/resources/auth_backend) | resource |
| [vault_aws_auth_backend_client.default](https://registry.terraform.io/providers/hashicorp/vault/3.12.0/docs/resources/aws_auth_backend_client) | resource |
| [vault_aws_auth_backend_role.default](https://registry.terraform.io/providers/hashicorp/vault/3.12.0/docs/resources/aws_auth_backend_role) | resource |
| [vault_generic_endpoint.rotate_root](https://registry.terraform.io/providers/hashicorp/vault/3.12.0/docs/resources/generic_endpoint) | resource |
| [aws_billing_service_account.default](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/data-sources/billing_service_account) | data source |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/4.54.0/docs/data-sources/iam_policy_document) | data source |


<!-- END_TF_DOCS -->