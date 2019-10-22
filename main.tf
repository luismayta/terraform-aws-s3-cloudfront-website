locals {
  tags = {
    terraform_id = var.namespace
    Environment  = var.stage
  }
  bucket_name = var.fqdn_bucket != "" ? var.fqdn_bucket : var.fqdn
}