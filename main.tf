locals {
  name = "vault-aws-auth-user"
}

data "aws_billing_service_account" "default" {}

resource "aws_iam_user" "default" {
  name = local.name

  tags = {
    Description = "IAM user for Vault AWS Authentication."
  }
}

resource "aws_iam_access_key" "default" {
  user = aws_iam_user.default.name
}

data "aws_iam_policy_document" "default" {
  version = "2012-10-17"

  statement {
    sid       = "AllowVaultAuth"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ec2:DescribeInstances",
      "iam:GetInstanceProfile",
      "iam:GetUser",
      "iam:GetRole"
    ]
  }

  statement {
    sid       = "ManageOwnAccessKeys"
    effect    = "Allow"
    resources = [aws_iam_user.default.arn]

    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:GetAccessKeyLastUsed",
      "iam:GetUser",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey"
    ]
  }
}

resource "aws_iam_user_policy" "default" {
  name   = local.name
  user   = aws_iam_user.default.name
  policy = data.aws_iam_policy_document.default.json
}

resource "vault_auth_backend" "default" {
  type = "aws"
}

resource "vault_aws_auth_backend_client" "default" {
  backend    = vault_auth_backend.default.path
  access_key = aws_iam_access_key.default.id
  secret_key = aws_iam_access_key.default.secret
}

resource "vault_generic_endpoint" "rotate_root" {
  ignore_absent_fields = true
  data_json            = jsonencode({})
  depends_on           = [aws_iam_user_policy.default]

  path = format(
    "%s/config/rotate-root",
    vault_aws_auth_backend_client.default.backend
  )
}

resource "vault_aws_auth_backend_role" "default" {
  backend              = vault_auth_backend.default.path
  role                 = local.name
  bound_account_ids    = [aws_billing_service_account.default.id]
  token_policies       = ["default"]
  auth_type            = "ec2"
  inferred_entity_type = "ec2_instance"
  token_ttl            = 60
  token_max_ttl        = 120
}
