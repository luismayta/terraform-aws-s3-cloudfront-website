resource "aws_s3_bucket" "main" {
  provider = "aws.main"
  bucket   = local.bucket_name
  acl      = "private"

  website {
    index_document = var.index_document
    error_document = var.error_document
    routing_rules  = var.routing_rules
  }

  force_destroy = var.force_destroy

  tags = merge(
    map(
      "Resource", "s3",
      "Name", "${var.namespace}-${local.bucket_name}"
    ),
    local.tags
  )
}


resource "aws_s3_bucket_policy" "main_policy" {
  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.main_policy.json
}

data "aws_iam_policy_document" "main_policy" {
  provider = aws.main

  statement {
    sid = "AllowedIPReadAccess"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.main.arn}/*",
    ]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"

      values = var.allowed_ips
    }

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }

  statement {
    sid = "AllowCFOriginAccess"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.main.arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:UserAgent"

      values = [
        var.refer_secret,
      ]
    }

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}
