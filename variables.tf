variable "policies" {
  type        = list(any)
  description = "List of Vault policies that auth-role should attach to"
}
