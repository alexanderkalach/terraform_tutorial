resource "null_resource" "validate_env" {
  count = "${var.environment == terraform.workspace ? 0 : 1}"
  "Env ${var.environment} != workspace ${terraform.workspace}" = true
}