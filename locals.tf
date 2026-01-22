# Terraform Local Values and Locals (optional)
locals {
  common_tags = {
    Terraform   = "true"
    Environment = var.environment
    CreatedAt   = timestamp()
  }
}
