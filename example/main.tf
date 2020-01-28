module "main" {
  source = "github.com/equipindustry/terraform-aws-s3-cloudfront-website"

  fqdn                = var.fqdn
  ssl_certificate_arn = data.aws_acm_certificate.domain.arn
  allowed_ips         = var.allowed_ips

  index_document = "index.html"
  error_document = "404.html"

  refer_secret = "${base64sha512("REFER-SECRET-19265125-${var.fqdn}-52865926")}"

  force_destroy = "true"

  providers = {
    aws.main       = aws.main
    aws.cloudfront = aws.cloudfront
  }
}