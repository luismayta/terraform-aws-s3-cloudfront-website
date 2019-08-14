variable "domain" {
  description = "The domain name :/ ."
  default     = "equipindustry.com"
}

variable "fqdn" {
  default = "equipindustry.com"
}

variable "allowed_ips" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "aws_region" {
  default = "us-east-1"
}

variable "availability_zone" {
  description = "The availability zone"
  default     = "us-east-1a"
}

variable "aws_route53_domain" {
  default = ""
}

variable "availability_zone_ebs" {
  default = "us-east-1a"
}

# load data
data "aws_acm_certificate" "domain" {
  domain   = var.domain
  statuses = ["ISSUED"]
}

data "aws_route53_zone" "main" {
  provider     = aws.main
  name         = var.domain
  private_zone = false
}