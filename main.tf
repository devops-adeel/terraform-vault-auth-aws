resource "aws_iam_user" "default" {
  name = "vault-aws-auth-user"

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
    effect = "Allow"
    actions = [
      "ec2:DescribeInstances",
      "iam:GetInstanceProfile",
      "iam:GetUser",
      "iam:GetRole"
    ]

    resources = ["*"]
  }

  statement {
    sid    = "ManageOwnAccessKeys"
    effect = "Allow"
    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:GetAccessKeyLastUsed",
      "iam:GetUser",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey"
    ]

    resources = aws_iam_user.default.arn
  }
}

resource "vault_auth_backend" "default" {
  type = "aws"
}

resource "vault_aws_auth_backend_client" "default" {
  backend    = vault_auth_backend.default.path
  access_key = aws_iam_access_key.default.id
  secret_key = aws_iam_access_key.default.secret
}
